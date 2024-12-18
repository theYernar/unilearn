import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/theme/styles.dart';

// ignore: must_be_immutable
class ResultsScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;

  ResultsScreen({
    super.key,
    required this.correctAnswers,
    required this.wrongAnswers,
  });

  Image gif = Image(image: AssetImage(AppGifs.ratings));

  @override
  Widget build(BuildContext context) {
    if (correctAnswers >= 9) {
      gif = const Image(image: AssetImage(GifEmoji.madness));
    } else if (correctAnswers >= 7 && correctAnswers < 9) {
      gif = const Image(image: AssetImage(GifEmoji.party));
    } else if (correctAnswers >= 5 && correctAnswers < 7){
      gif = const Image(image: AssetImage(GifEmoji.happy));
    } else if (correctAnswers >= 4 && correctAnswers < 5){
      gif = const Image(image: AssetImage(GifEmoji.happy1_));
    } else if (correctAnswers >= 2 && correctAnswers <= 3){
      gif = const Image(image: AssetImage(GifEmoji.worried));
    } else if (correctAnswers <= 1){
      gif = const Image(image: AssetImage(GifEmoji.angry));
    } 

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Результаты',
          style: CustomTextStyles().TitleTextStyle(24)
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 120,),
            SizedBox(
              height: 180,
              child: gif
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Правильных ответов: $correctAnswers',
              style:
                  GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Неправильных ответов: $wrongAnswers',
              style:
                  GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    side: BorderSide(color: Colors.black.withOpacity(0.1)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Завершить',
                  style: GoogleFonts.nunito(
                      color: AppColors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
