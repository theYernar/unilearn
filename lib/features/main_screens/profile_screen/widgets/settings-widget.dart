import 'package:flutter/material.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:unilearn/features/main_screens/profile_screen/data/profile-data.dart';
import './container-body-data-widget.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: containerStyle(),
      child: Column(
        children: settings
            .asMap()
            .entries
            .map((entry) {
              final index = entry.key;
              final data = entry.value;
              final isLast = index == settings.length - 1; // Проверка на последний элемент
              return ContainerBodyDateWidget(data: data, isLast: isLast);
            })
            .toList(),
      )
    );
  }
}
