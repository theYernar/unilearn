import 'package:flutter/material.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:unilearn/features/main_screens/profile_screen/data/profile-data.dart';
import 'package:vibration/vibration.dart';

import '../../../../settings/settings.dart';

class ContainerBodyDateWidget extends StatelessWidget {
  final Date data;
  final bool isLast;
  const ContainerBodyDateWidget({
    super.key,
    required this.data,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Column(
            children: [
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              data.icon,
                              size: 28,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              data.text,
                              style: CustomTextStyles().ProfileTextStyle(value - 6),
                            )
                          ],
                        )),
                    if (data.isButton)
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (vibration != false) {
                              Vibration.vibrate(duration: 200);
                            }
                            _openBottomSheet(context, data);
                          },
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                  ],
                ),
              ),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 0.5,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
            ],
          );
        }
      );
  }

  Future<dynamic> _openBottomSheet(BuildContext context, Date data) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(width: double.infinity, child: data.sheet);
      },
    );
  }
}
