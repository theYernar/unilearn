import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
// import 'package:unilearn/features/main_screens/lessons_screen/my_courses/course_lessons/data/course_lessons_data.dart';
// import 'package:unilearn/features/main_screens/lessons_screen/my_courses/course_lessons/data/lesson.dart';
import 'widgets/custom_card.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/styles.dart';

import '../data/course_lessons_data.dart';
import '../data/lesson.dart';

class MyLessonsScreen extends StatelessWidget {
  const MyLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final String course = arguments['course'];
    final List<Lesson>? lessons = courseLessons[course]!;
    
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
                    course,
                    style: CustomTextStyles().TitleTextStyle(value + 4),
                  )),

                  
              body: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: lessons!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: CustomCard(index: index, data: lessons[index], course: course,),
                  );
                },
              )
            );
        }
      );
  }
}
