import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:vibration/vibration.dart';
import './data/color_scheme_data.dart';

ValueNotifier<List<ColorSchemeData>> selectedType = ValueNotifier(defaultColor);

class ColorSchemeForColorBlindPeople extends StatelessWidget {
  const ColorSchemeForColorBlindPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _HeaderWidget(),
        const _CustomAppBar(),
      ],
    ));
  }
}

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 70,
        ),
        const _ColorsWidget(),
        const SizedBox(
          height: 20,
        ),
        _SelectColorScheme(),
        // const Spacer(),
        const _NextButton(),
      ],
    );
  }
}

class _ColorsWidget extends StatelessWidget {
  const _ColorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ColorSchemeData>>(
      valueListenable: selectedType,
      builder: (context, value, child) {
        return Column(
          children: value.map((data) => _ColorsWidgetBody(data: data)).toList(),
        );
      },
    );
  }
}

class _ColorsWidgetBody extends StatelessWidget {
  final ColorSchemeData data;
  const _ColorsWidgetBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: SizedBox(
        height: 45,
        child: Row(
          children: [
            SizedBox(
              width: 65,
              child: Text(
                data.text,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      data.color.withOpacity(0.0),
                      data.color.withOpacity(0.5),
                      data.color.withOpacity(0.9),
                      data.color.withOpacity(0.8),
                      data.color.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                  Navigator.of(context).pushNamed(AppRoutes.fontSizeSettingsScreen);
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

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Positioned(
            top: 60,
            left: 10,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowLeft01,
                      color: Colors.black,
                      size: 35,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text('Коррекция Цвета',
                    style: CustomTextStyles().TitleTextStyle(value)),
                const SizedBox(width: 5,),
                const Text('beta')
                    
              ],
            ),
          );
        });
  }
}

class _SelectColorScheme extends StatefulWidget {
  @override
  _SelectColorSchemeState createState() => _SelectColorSchemeState();
}

class _SelectColorSchemeState extends State<_SelectColorScheme> {
  bool isColorCorrectionEnabled = false; // Статус переключателя
  String selectedOption = 'Deuteranomaly'; // Выбранный пункт

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Переключатель Use color correction
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Использовать цветокоррекцию',
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Switch(
                value: isColorCorrectionEnabled,
                onChanged: (value) {
                  setState(() {
                    isColorCorrectionEnabled = value;
                    if (isColorCorrectionEnabled != true) {
                      selectedType.value = defaultColor;
                    }
                  });
                },
                activeColor: AppColors.blue2,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: AppColors.blue2,
                trackOutlineColor:
                    const WidgetStatePropertyAll(Colors.transparent),
              ),
            ],
          ),
        ),
        // -------------------------------------------------------------

        // Список вариантов с градиентом
        SizedBox(
          height: 290,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              buildOptionTile(
                  'Дейтераномалия', 'Красно-зеленый', deuteranomaly),
              buildOptionTile('Протаномалия', 'Красно-зеленый', protanomaly),
              buildOptionTile('Тританомалия', 'Сине-желтый', tritanomaly),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.colorSchemedMoreDetails);
              },
              child: Text(
                'Подробнее',
                style: GoogleFonts.nunito(fontSize: 20, color: AppColors.blue),
              )),
        )
      ],
    );
  }

  // Виджет для построения одной плитки
  Widget buildOptionTile(String title, String subtitle, var type) {
    bool isSelected = selectedOption == title;
    return GestureDetector(
      onTap: isColorCorrectionEnabled
          ? () {
              setState(() {
                selectedOption = title;
                selectedType.value = type;
              });
            }
          : null, // Если выключено - жесты не обрабатываются
      child: Opacity(
        opacity: isColorCorrectionEnabled ? 1.0 : 0.4, // Уменьшает прозрачность
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.nunito(
                  color: isSelected ? Colors.white70 : Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
