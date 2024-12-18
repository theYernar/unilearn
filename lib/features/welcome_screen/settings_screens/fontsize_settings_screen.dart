import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:vibration/vibration.dart';

import '../../../settings/settings_storage.dart';


class FontSizeSettingsScreen extends StatelessWidget {
  const FontSizeSettingsScreen({super.key});

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
        _TextSizeSliderWidget(),
        _NextButton(),
      ],
    );
  }
}

class _TextSizeSliderWidget extends StatefulWidget {
  const _TextSizeSliderWidget({super.key});

  @override
  State<_TextSizeSliderWidget> createState() => _TextSizeSliderWidgetState();
}




class _TextSizeSliderWidgetState extends State<_TextSizeSliderWidget> {
  final SettingsStorage storage = SettingsStorage();

  @override
  void initState() {
    super.initState();
    _loadSliderValue();
  }

  // Метод для загрузки значения из JSON
  Future<void> _loadSliderValue() async {
    double loadedValue = await storage.loadSliderValue();
    globalSliderNotifier.value = loadedValue;
  }

  // Метод для сохранения значения в JSON
  Future<void> _saveSliderValue(double value) async {
    await storage.saveSliderValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: globalSliderNotifier, // Обработчик изменения значения слайдера
      builder: (context, value, child) {
        return Slider(
          thumbColor: AppColors.blue,
          activeColor: AppColors.blue2,
          inactiveColor: const Color(0xFFC5EEE0),
          value: value,
          min: 16,
          max: 36,
          divisions: 5,
          label: value.round().toString(),
          onChanged: (double newValue) {
            globalSliderNotifier.value = newValue; // Обновляем значение слайдера
            _saveSliderValue(newValue); // Сохраняем новое значение в JSON
          },
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
        }
      );
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
              'Выберите размер шрифта',
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
    return const Image(
        height: 510, image: AssetImage(TheMark.theMark3));
  }
}
