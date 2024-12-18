import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/features/main_screens/lessons_screen/my_courses/data/course_lessons_data.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:vibration/vibration.dart';
// import 'package:unilearn/routes/app_routes.dart';
import '../../../../../../theme/styles.dart';
import '../../data/lesson.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  final Lesson data;
  final String course;
  final int index;
  CustomCard(
      {super.key,
      required this.data,
      required this.index,
      required this.course});

  Color color = Colors.green;

  @override
  Widget build(BuildContext context) {
    if (data.percent < 70 && data.percent > 40) {
      color = Colors.orange;
    } else if (data.percent < 40) {
      color = Colors.red;
    } else {
      color = Colors.green;
    }
    final List<Lesson> lessons = courseLessons[course]!;

    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return IntrinsicHeight(
            child: Container(
              width: double.infinity,
              decoration: containerStyle(),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          '${data.id}',
                          style: GoogleFonts.nunito(
                            fontSize: value,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            data.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.nunito(
                                fontSize: value - 2, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          '${data.percent} %',
                          style: GoogleFonts.nunito(
                            fontSize: value,
                            color: color,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if (vibration != false) {
                          Vibration.vibrate(duration: 200);
                        }
                        Navigator.pushNamed(context, AppRoutes.lessonLearnScreen,
                            arguments: {'lesson': lessons[index]});
                      },
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      );
  }
}
