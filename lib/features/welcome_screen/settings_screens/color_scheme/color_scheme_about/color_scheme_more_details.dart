import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/styles.dart';

class ColorSchemeAbout extends StatelessWidget {
  const ColorSchemeAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          // Custom AppBar
          const _CustomAppBar(),
          // Main Content
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 120, left: 16, right: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Чтобы эта функция работала корректно, перейдите в настройки телефона:\n\n'
                    'Настройки → Дополнительные параметры → Специальные возможности → Коррекция цвета.',
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
                Text('Подробнее',
                    style: CustomTextStyles().TitleTextStyle(value))
              ],
            ),
          );
        });
  }
}