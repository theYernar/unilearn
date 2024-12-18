import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:vibration/vibration.dart';
import './result_screen.dart';

class Question {
  final String question;
  final Map<String, String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: Map<String, String>.from(json['options']),
      correctAnswer: json['correct_answer'],
    );
  }
}

Future<List<Question>> loadQuestions() async {
  final String response = await rootBundle.loadString('assets/questions.json');
  final List<dynamic> data = json.decode(response);
  return data.map((item) => Question.fromJson(item)).toList();
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Question>> _questionsFuture;

  @override
  void initState() {
    super.initState();
    _questionsFuture = loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final title = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            final result = await showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Выход'),
                content: const Text('Вы уверены, что хотите завершить тест?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Отмена'),
                    child: Text(
                      'Отмена',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Завершить');
                    },
                    child: Text(
                      'Завершить',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            );
            if (result == 'Завершить') {
              Navigator.pop(context); // Возвращаемся на предыдущий экран
            }
          },
          icon: const Icon(
            HugeIcons.strokeRoundedCancel01,
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: CustomTextStyles().TitleTextStyle(28),
        ),
      ),
      body: FutureBuilder<List<Question>>(
        future: _questionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Нет доступных вопросов'));
          }

          final List<Question> questions = snapshot.data!;
          return QuizWidget(questions: questions);
        },
      ),
    );
  }
}

class QuizWidget extends StatefulWidget {
  final List<Question> questions;

  const QuizWidget({super.key, required this.questions});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;

  void _finishQuiz(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          correctAnswers: _correctAnswers,
          wrongAnswers: _wrongAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Question question = widget.questions[_currentQuestionIndex];
    final int totalQuestions = widget.questions.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            '${_currentQuestionIndex + 1} / $totalQuestions',
            style: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            question.question,
            style:
                GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ...question.options.entries.map((entry) {
          return RadioListTile<String>(
            fillColor: const WidgetStatePropertyAll(AppColors.blue),
            title: Text(
              entry.value,
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            value: entry.value,
            groupValue: _selectedAnswer,
            onChanged: (value) {
              print(value);
              setState(() {
                _selectedAnswer = value;
              });
            },
          );
        }).toList(),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Vibration.vibrate(duration: 200);
                    if (_selectedAnswer != null){
                      if (_selectedAnswer == question.correctAnswer) {
                      _correctAnswers++;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.green,
                          content: Text(
                            'Правильно!',
                            style: GoogleFonts.nunito(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          duration: const Duration(milliseconds: 2000),
                          width: 280.0, // Width of the SnackBar.
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical:
                                  10 // Inner padding for SnackBar content.
                              ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    } else {
                      _wrongAnswers++;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(
                            'Неправильно! Правильный ответ: ${question.correctAnswer}',
                            style: GoogleFonts.nunito(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          duration: const Duration(milliseconds: 2000),
                          width: 280.0, // Width of the SnackBar.
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical:
                                  10 // Inner padding for SnackBar content.
                              ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    }
                      setState(() {
                        if (_currentQuestionIndex < totalQuestions - 1) {
                          _currentQuestionIndex++;
                          _selectedAnswer = null;
                        } else {
                          _finishQuiz(context);
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(
                            'Выберите один вариант',
                            style: GoogleFonts.nunito(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          duration: const Duration(milliseconds: 2000),
                          width: 280.0, // Width of the SnackBar.
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical:
                                  10 // Inner padding for SnackBar content.
                              ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Ответить',
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
