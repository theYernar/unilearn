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
      body: Stack(
        children: [
          const _CustomAppBar(),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 130, left: 16),
              child: Text(
                'Бла бла бла',
                style: GoogleFonts.nunito(
                  fontSize: 30
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