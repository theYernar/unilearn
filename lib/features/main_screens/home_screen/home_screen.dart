import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/features/main_screens/home_screen/widgets/progress_widget.dart';
import 'package:unilearn/features/main_screens/home_screen/widgets/recommended_content_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        // physics: AlwaysScrollableScrollPhysics(),
        children: const [
          _HeaderWidget(),
        ]);
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MainTitle(),
          SizedBox(height: 30,),
          ProgressWidget(),
          SizedBox(height: 30,),
          RecommendedContent(),          
        ],
      ),
    );
  }
}


class _MainTitle extends StatelessWidget {
  const _MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: globalSliderNotifier,
      builder: (context, value, child) {
        return Text(
          'Главная',
          style: GoogleFonts.nunito(
            fontSize: value + 4, 
            fontWeight: FontWeight.bold
          ),
        );
      }
    );
  }
}
