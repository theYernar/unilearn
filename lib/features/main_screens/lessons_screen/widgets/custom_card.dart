import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:vibration/vibration.dart';
import '../../../../theme/styles.dart';
import '../data/lessons_data.dart';

class CustomCard extends StatelessWidget {
  final LessonsData data;
  final int index;
  CustomCard({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Column(
            children: [
              Container(
                height: 65,
                width: double.infinity,
                decoration: containerStyle(),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Icon(
                          data.icon,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            data.title,
                            style: GoogleFonts.nunito(
                                fontSize: value - 2,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (vibration != false) {
                            Vibration.vibrate(duration: 200);
                          }
                          Navigator.of(context).pushNamed(
                            AppRoutes.coursesScreen,
                            arguments: ({'title': lessons_screen_data[index].title})
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        });
  }
}
