import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class LessonsData {
  LessonsData({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
}

final List<LessonsData> lessons_screen_data = [
  LessonsData(icon: HugeIcons.strokeRoundedBookOpen01, title: 'Мои курсы'),
  LessonsData(icon: HugeIcons.strokeRoundedPencilEdit01, title: 'Задание')
];