import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/colors.dart';
// import 'package:unilearn/features/main_screens/lessons_screen/my_courses/data/module_data.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:vibration/vibration.dart';
import '../../data/lesson.dart';
import './youtube_player.dart';
import 'package:flutter_tts/flutter_tts.dart';

// import '../../data/course_lessons_data.dart';

class LessonLearnScreen extends StatefulWidget {
  const LessonLearnScreen({super.key});

  @override
  State<LessonLearnScreen> createState() => _LessonLearnScreenState();
}

class _LessonLearnScreenState extends State<LessonLearnScreen> {
  IconData volume = HugeIcons.strokeRoundedVolumeHigh;

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  void volumeController(String text) {
    if (volume != HugeIcons.strokeRoundedVolumeHigh) {
      volume = HugeIcons.strokeRoundedVolumeHigh;
      flutterTts.pause();
    } else {
      volume = HugeIcons.strokeRoundedStop;
      speakText(text);
    }
    setState(() {});
  }

  FlutterTts flutterTts = FlutterTts();

  void speakText(String text) async {
    await flutterTts.setLanguage("ru-RU");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final Lesson lesson = arguments['lesson'];

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              HugeIcons.strokeRoundedArrowLeft01,
              size: 35,
            ),
          ),
          title: Text(
            lesson.title,
            style: CustomTextStyles().TitleTextStyle(28),
          )),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YouTubePlayer(id: lesson.url),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxWidth: 300), // Ограничиваем максимальную ширину
                    child: Text(
                      lesson.title,
                      style: CustomTextStyles().TitleTextStyle(28),
                      softWrap: true, // Включаем автоматический перенос строки
                      overflow: TextOverflow.visible, // Выводим все содержимое
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      if (vibration != false) {
                        Vibration.vibrate(duration: 200);
                      }
                      flutterTts.stop();
                    },
                    child: IconButton(
                      onPressed: () {
                        if (vibration != false) {
                          Vibration.vibrate(duration: 200);
                        }
                        volumeController(lesson.lecture!);
                      },
                      icon: Icon(
                        volume,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                lesson.lecture!,
                style: GoogleFonts.nunito(
                  fontSize: 25
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                  height: 70,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.testScreen,
                          arguments: ({'title': lesson.title})
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        side:
                            const BorderSide(color: AppColors.blue, width: 1.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Пройдти тест',
                            style: GoogleFonts.nunito(
                                fontSize: 24, color: AppColors.blue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(image: AssetImage(AppGifs.test))
                        ],
                      ))),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
