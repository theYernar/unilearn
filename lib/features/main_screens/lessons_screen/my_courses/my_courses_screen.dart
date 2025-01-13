import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
// import 'package:unilearn/features/main_screens/lessons_screen/data/lessons_data.dart';
import 'package:unilearn/features/main_screens/lessons_screen/my_courses/widgets/custom_card.dart';
// import 'package:unilearn/features/main_screens/lessons_screen/widgets/custom_button.dart';
import '../../../../settings/settings.dart';
import '../../../../theme/styles.dart';
// import './data/my_courses_data.dart';
import 'data/course_lessons_data.dart';
// import '../data/lessons_data.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final String title = arguments['title'];
    // final List<LessonsData>? lessons = lessons_screen_data;

    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    HugeIcons.strokeRoundedArrowLeft01,
                    size: 35,
                  ),
                ),
                title: Text(
                  title,
                  style: CustomTextStyles().TitleTextStyle(value + 4),
                )
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Количество столбцов
                    crossAxisSpacing: 10, // Расстояние между столбцами
                    mainAxisSpacing: 10, // Расстояние между строками
                    childAspectRatio: 1.016, // Пропорции элементов (ширина/высота)
                  ),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      index: index,
                      data: courses[index],
                    );
                  },
                ),
              )

            );
        });
  }
}
