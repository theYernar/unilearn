import 'package:flutter/material.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/styles.dart';
import 'widgets/custom_card.dart';
import './data/lessons_data.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
      child: Stack(
        children: [
          const _MainTitle(),
          ListView.builder(
            padding: const EdgeInsets.only(top: 60),
            itemCount: lessons_screen_data.length,
            itemBuilder: (context, index) {
              return CustomCard(
                data: lessons_screen_data[index],
                index: index,
              );
            },
          ),
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
            'Уроки',
            style: CustomTextStyles().TitleTextStyle(value + 4),
          );
        });
  }
}
