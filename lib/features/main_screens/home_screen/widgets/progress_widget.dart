import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:unilearn/core/radial_percent_widget.dart';
import 'package:vibration/vibration.dart';

class _ProgressData {
  final Widget widget;
  final Widget text;

  _ProgressData({required this.widget, required this.text});
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Прогресс',
                style: CustomTextStyles().TitleTextStyle(value),
              ),
              const SizedBox(
                height: 15,
              ),
              const _FirstRow(),
              const SizedBox(
                height: 10,
              ),
              const _SecondRow()
            ],
          );
        });
  }
}

class _SecondRow extends StatelessWidget {
  const _SecondRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: SizedBox(
            height: 90,
            child: Stack(
              children: [
                Container(
                  decoration: containerStyle(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const SizedBox(
                            height: 60,
                            width: 50,
                            child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(AppGifs.ratings))),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '3',
                                style: GoogleFonts.nunito(
                                    height: 1,
                                    wordSpacing: 2,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'ТОП',
                                style: GoogleFonts.nunito(
                                    height: 1,
                                    fontSize: 20,
                                    color: AppColors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      if (vibration != false) {
                        Vibration.vibrate(duration: 200);
                      }
                      Navigator.of(context).pushNamed(AppRoutes.topUsersScreen);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: SizedBox(
            height: 90,
            width: 210,
            child: Stack(
              children: [
                Container(
                  decoration: containerStyle(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 70,
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(Ranks.trophy)),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Gold',
                                style: GoogleFonts.nunito(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      if (vibration != false) {
                        Vibration.vibrate(duration: 200);
                      }
                      _ModalWindow(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _ModalWindow(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
                right: 20,
                top: 50,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      HugeIcons.strokeRoundedCancel01,
                      size: 40,
                      color: Colors.black,
                    ))),
            Center(
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Image(
                      width: 180,
                      image: AssetImage(Ranks.trophy),
                    ),
                    Text('Gold',
                        style: GoogleFonts.nunito(
                            fontSize: 34, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                      'Вы в золотом лиге!',
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.rankScreen);
                        },
                        child: Text('Подробнее'))
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FirstRow extends StatelessWidget {
  const _FirstRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IntrinsicWidth(
          child: SizedBox(
            height: 90,
            child: Stack(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 200),
                  decoration: containerStyle(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 70,
                            width: 70,
                            child: RadialPercentWidget(
                              percent: 0.1,
                              fillColor: Colors.transparent,
                              lineColor: const Color(0xFF44BDAC),
                              freeColor: const Color(0xFFC5EEE0),
                              lineWidth: 7,
                              child: Text(
                                '10%',
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Выполнено',
                                style: GoogleFonts.nunito(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Positioned(
                                  right: 20,
                                  top: 50,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(
                                        HugeIcons.strokeRoundedCancel01,
                                        size: 40,
                                        color: Colors.black,
                                      ))),
                              Center(
                                child: Container(
                                  width: 350,
                                  height: 300,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                          height: 120,
                                          width: 120,
                                          child: RadialPercentWidget(
                                            percent: 0.1,
                                            fillColor: Colors.transparent,
                                            lineColor: const Color(0xFF44BDAC),
                                            freeColor: const Color(0xFFC5EEE0),
                                            lineWidth: 15,
                                            child: Text(
                                              '10%',
                                              style: GoogleFonts.nunito(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('Выполнено',
                                          style: GoogleFonts.nunito(
                                              fontSize: 34,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        'из всех заданий',
                                        style: GoogleFonts.nunito(
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: IntrinsicWidth(
            child: SizedBox(
              height: 90,
              child: Stack(
                children: [
                  Container(
                    decoration: containerStyle(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Image(
                              width: 60, image: AssetImage(AppGifs.fire)),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '5',
                                  style: GoogleFonts.nunito(
                                      height: 1,
                                      wordSpacing: 2,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'дней',
                                  style: GoogleFonts.nunito(
                                      height: 1,
                                      fontSize: 20,
                                      color: AppColors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (vibration != false) {
                          Vibration.vibrate(duration: 200);
                        }
                        _ModalWindow(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _ModalWindow(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
                right: 20,
                top: 50,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      HugeIcons.strokeRoundedCancel01,
                      size: 40,
                      color: Colors.black,
                    ))),
            Center(
              child: Container(
                width: 350,
                height: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Image(
                      width: 180,
                      image: AssetImage(AppGifs.fire),
                    ),
                    Text('5 дней',
                        style: GoogleFonts.nunito(
                            fontSize: 34, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                      'Ударном режиме!',
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
