import 'package:flutter/material.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:unilearn/features/main_screens/profile_screen/data/profile-data.dart';
import './container-body-data-widget.dart';

class SupportWidget extends StatelessWidget {
  const SupportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: containerStyle(),
      child: Column(
        children: support
            .asMap()
            .entries
            .map((entry) {
              final index = entry.key;
              final data = entry.value;
              final isLast = index == support.length - 1; // Проверка на последний элемент
              return ContainerBodyDateWidget(data: data, isLast: isLast);
            })
            .toList(),
      )
    );
  }
}
