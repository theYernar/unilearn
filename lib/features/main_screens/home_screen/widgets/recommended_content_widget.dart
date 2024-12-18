import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:vibration/vibration.dart';

class RecommendedContent extends StatelessWidget {
  const RecommendedContent({
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
                'Рекомендуемый контент',
                style: CustomTextStyles().TitleTextStyle(value),
              ),
              const SizedBox(
                height: 15,
              ),
              const _TasksOfTheDayWidget(),
              const SizedBox(height: 10),
              const _NewMaterialsWidget()
            ],
          );
        });
  }
}

class _NewMaterialsWidget extends StatelessWidget {
  const _NewMaterialsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Container(
            height: 120,
            decoration: containerStyle(),
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Новые материалы',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.nunito(
                            fontSize: value, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child:
                      Image(width: 90, image: AssetImage(AppImages.newLabel)),
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
                        arguments: ({'title': 'Новые материалы'})
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          );
        });
  }

  // Future<dynamic> ModalWindow(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Stack(
  //         children: [
  //           Positioned(
  //               right: 20,
  //               top: 50,
  //               child: IconButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   icon: const Icon(
  //                     HugeIcons.strokeRoundedCancel01,
  //                     size: 40,
  //                     color: Colors.black,
  //                   ))),
  //           Center(
  //             child: Container(
  //               width: 350,
  //               height: 320,
  //               padding: const EdgeInsets.all(16),
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(16),
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   const Image(
  //                     width: 150,
  //                     image: AssetImage(AppGifs.sad),
  //                   ),
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   Text("Раздел 'Новые материалы' \nнедоступен.",
  //                       style: GoogleFonts.nunito(
  //                           fontSize: 22, fontWeight: FontWeight.bold)),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

class _TasksOfTheDayWidget extends StatelessWidget {
  const _TasksOfTheDayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Container(
            height: 120,
            width: double.infinity,
            decoration: containerStyle(),
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Задания дня',
                        style: GoogleFonts.nunito(
                            fontSize: value, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 15),
                      const Image(width: 90, image: AssetImage(AppGifs.task))
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
                      Navigator.of(context).pushNamed(
                        AppRoutes.coursesScreen,
                        arguments: ({'title': 'Задания дня'})
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          );
        });
  }

  // Future<dynamic> ModalWindow(BuildContext context) {
  //   return showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return Stack(
  //       children: [
  //         Positioned(
  //           right: 20,
  //           top: 50,
  //             child: IconButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               icon: const Icon(
  //                 HugeIcons.strokeRoundedCancel01,
  //                 size: 40,
  //                 color: Colors.black,
  //               )
  //             )
  //           ),
  //         Center(
  //           child: Container(
  //             width: 350,
  //             height: 320,
  //             padding: const EdgeInsets.all(16),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 const SizedBox(height: 20,),
  //                 const Image(
  //                   width: 150,
  //                   image: AssetImage(AppGifs.sad),
  //                 ),
  //                 const SizedBox(height: 20,),
  //                 Text(
  //                   "Раздел 'Задания дня' \nнедоступен.",
  //                     style: GoogleFonts.nunito(
  //                         fontSize: 22, fontWeight: FontWeight.bold)),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     );
  //   },
  // );
  // }
}
