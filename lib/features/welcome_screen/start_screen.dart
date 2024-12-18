import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:vibration/vibration.dart';

import '../../settings/settings_storage.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: const _HeaderWidget(),
        ),
      ),
    );
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
        SizedBox(height: 0),
        _StartButtonsWidget(),
      ],
    );
  }
}

class _StartButtonsWidget extends StatefulWidget {
  const _StartButtonsWidget({
    super.key,
  });

  @override
  State<_StartButtonsWidget> createState() => _StartButtonsWidgetState();
}

class _StartButtonsWidgetState extends State<_StartButtonsWidget> {
  final SettingsStorage storage = SettingsStorage();

  @override
  void initState() {
    super.initState();
    _loadSliderValue();
    _loadVibrationState();
  }

  // Метод для загрузки значения из JSON
  Future<void> _loadSliderValue() async {
    double loadedValue = await storage.loadSliderValue();
    globalSliderNotifier.value = loadedValue;
  }

  // Загрузка состояния вибрации из JSON
  Future<void> _loadVibrationState() async {
    final savedState = await storage.loadVibrationState();
    setState(() {
      vibration = savedState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        children: [
          _FirstButtonWidget(),
          SizedBox(
            height: 14,
          ),
          _SecondButtonWidget(),
        ],
      ),
    );
  }
}

class _SecondButtonWidget extends StatelessWidget {
  const _SecondButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(93, 0, 0, 0),
                  offset: Offset(2, 2),
                  blurRadius: 8)
            ]),
            child: ElevatedButton(
              onPressed: () {
                if (vibration != false) {
                    Vibration.vibrate(duration: 200);
                  }
                Navigator.of(context).pushNamed(AppRoutes.authorizationScreen);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: AppColors.white,
                  overlayColor: const Color.fromARGB(255, 20, 189, 158),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  side: const BorderSide(color: AppColors.blue, width: 1.5)),
              child:Text(
                'У меня уже есть aккаунт',
                style:  GoogleFonts.nunito(
                    color: AppColors.blue,
                    fontSize: value,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        }
      );
  }
}

class _FirstButtonWidget extends StatelessWidget {
  const _FirstButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Container(
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
                Navigator.of(context).pushNamed(AppRoutes.welcomeScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btnBackground,
                overlayColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: Text(
                'Начать',
                style:  GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: value,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          );
        }
      );
  }
}

class _TheGrinchImage extends StatelessWidget {
  const _TheGrinchImage();

  @override
  Widget build(BuildContext context) {
    return const Image(
      height: 510,
      image: AssetImage(TheMark.theMark1),
    );
  }
}
