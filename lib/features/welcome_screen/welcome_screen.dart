import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:vibration/vibration.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: const _HeaderWidget(),
          ),
        ),
        Positioned(
          top: 60,
          left: 10,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedArrowLeft01,
                color: Colors.black,
                size: 35,
              )),
        ),
      ],
    ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _TheGrinchImage(),
        SizedBox(
          height: 0,
        ),
        _WelcomeTextWidget(),
        _NextButton(),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(93, 0, 0, 0),
                    offset: Offset(0, 4),
                    blurRadius: 8)
              ]),
              child: ElevatedButton(
                onPressed: () {
                  if (vibration != false) {
                    Vibration.vibrate(duration: 200);
                  }
                  Navigator.of(context)
                      .pushNamed(AppRoutes.colorScheme);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.btnBackground,
                  overlayColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Text(
                  'Далее',
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: value,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        });
  }
}

class _WelcomeTextWidget extends StatelessWidget {
  const _WelcomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Column(
            children: [
              Text('Привет, я Максат!',
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: value+8,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Прежде чем начать, давайте',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: value,
                ),
              ),
              Text(
                'настроим приложение.',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: value,
                ),
              ),
            ],
          );
        }
      );
  }
}

class _TheGrinchImage extends StatelessWidget {
  const _TheGrinchImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
        height: 510, image: AssetImage(TheMark.theMark8));
  }
}
