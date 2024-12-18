import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:unilearn/features/main_screens/profile_screen/data/profile-data.dart';
import 'package:vibration/vibration.dart';
import '../../../../settings/settings.dart';
import './container-body-data-widget.dart';

class LogoutWidget extends StatefulWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  State<LogoutWidget> createState() => _LogoutWidgetState();
}

class _LogoutWidgetState extends State<LogoutWidget> {
  void logoutFunc() {
    if (vibration != false) {
      Vibration.vibrate(duration: 200);
    }
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Выход'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Отмена'),
            child: Text(
              'Отмена',
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blue
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.startScreen),
            child: Text(
              'Выйти',
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blue
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: containerStyle(),
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Column(
                children: logout.asMap().entries.map((entry) {
                  final index = entry.key;
                  final data = entry.value;
                  final isLast = index ==
                      logout.length - 1; // Проверка на последний элемент
                  return ContainerBodyDateWidget(data: data, isLast: isLast);
                }).toList(),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: logoutFunc,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        ));
  }
}
