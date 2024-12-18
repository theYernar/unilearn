import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/routes/app_routes.dart';
// import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:vibration/vibration.dart';

import '../../../settings/settings_storage.dart';

class MiniSettingsScreen extends StatelessWidget {
  const MiniSettingsScreen({super.key});

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
            child: _HeaderWidget(),
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
  _HeaderWidget({
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
        _TextWidget(),
        _SettingsWidget(),
        _NextButton(),
      ],
    );
  }
}

class _SettingsWidget extends StatefulWidget {
  const _SettingsWidget({
    super.key,
  });

  @override
  State<_SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<_SettingsWidget> {
  final SettingsStorage storage = SettingsStorage();

  @override
  void initState() {
    super.initState();
    _loadVibrationState();
  }

  // Загрузка состояния вибрации из JSON
  Future<void> _loadVibrationState() async {
    final savedState = await storage.loadVibrationState();
    setState(() {
      vibration = savedState;
    });
  }

  // Сохранение состояния вибрации в JSON
  Future<void> _saveVibrationState(bool value) async {
    await storage.saveVibrationState(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: globalSliderNotifier,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Вибрация',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: value,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Expanded(child: SizedBox()),
              Switch(
                value: vibration,
                activeColor: AppColors.blue2,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: AppColors.blue2,
                trackOutlineColor:
                    const WidgetStatePropertyAll(Colors.transparent),
                onChanged: (bool value) {
                  setState(() {
                    vibration = value;
                    if (value) {
                      Vibration.vibrate(); // Вибрация, если включено
                    }
                  });
                  _saveVibrationState(value); // Сохраняем новое значение
                },
              ),
            ],
          ),
        );
      },
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
                  Navigator.of(context).pushNamed(AppRoutes.registrationScreen);
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

class _TextWidget extends StatelessWidget {
  const _TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: globalSliderNotifier,
      builder: (context, value, child) {
        return Column(
          children: [
            Text(
              'Выберите нужную параметр',
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: value,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}

class _TheGrinchImage extends StatelessWidget {
  const _TheGrinchImage();

  @override
  Widget build(BuildContext context) {
    return const Image(height: 510, image: AssetImage(TheMark.theMark5));
  }
}
