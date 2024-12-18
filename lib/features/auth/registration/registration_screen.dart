import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:vibration/vibration.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: const _HeaderWidget(),
            ),
          ),
          Positioned(
            top: 60,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeft01,
                  color: Colors.black,
                  size: 35,
                )),
          ),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  State<_HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget> {
  final Color _color = AppColors.blue;
  HugeIcon _icon = const HugeIcon(
      icon: HugeIcons.strokeRoundedViewOffSlash, color: Colors.black);
  bool _passObscure = true;

  void passHide() {
    if (_icon.icon == HugeIcons.strokeRoundedView) {
      _icon = const HugeIcon(
          icon: HugeIcons.strokeRoundedViewOffSlash, color: Colors.black);
      _passObscure = true;
    } else {
      _icon = const HugeIcon(
          icon: HugeIcons.strokeRoundedView, color: Colors.black);
      _passObscure = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration textFieldDecorator(
        String text, icon, double fontSizeValue) {
      final color = _color;
      return InputDecoration(
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          labelText: text,
          labelStyle: GoogleFonts.nunito(
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
              fontSize: fontSizeValue),
          suffixIcon: icon,
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 2),
            borderRadius: BorderRadius.circular(15),
          ));
    }

    final icons = _icon;
    final passObscure = _passObscure;

    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const SizedBox(height: 130,),
                Text(
                  'Теперь давай создадим',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: value + 2
                  ),
                ),
                Text(
                  'твой аккаунт',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: value + 2
                  ),
                ),
                const SizedBox(height: 50,),
                TextField(
                  cursorColor: AppColors.btnBackground,
                  textInputAction: TextInputAction.next,
                  decoration: textFieldDecorator('почта', null, value - 5),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  cursorColor: AppColors.btnBackground,
                  textInputAction: TextInputAction.next,
                  decoration:
                      textFieldDecorator('имя пользователя', null, value - 5),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  cursorColor: AppColors.btnBackground,
                  autocorrect: false,
                  enableSuggestions: false,
                  textInputAction: TextInputAction.next,
                  decoration: textFieldDecorator('пароль', null, value - 5),
                  obscureText: passObscure,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  cursorColor: AppColors.btnBackground,
                  autocorrect: false,
                  enableSuggestions: false,
                  textInputAction: TextInputAction.go,
                  decoration: textFieldDecorator('подтвердите пароль',
                      IconButton(onPressed: passHide, icon: icons), value - 5),
                  obscureText: passObscure,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                  if (vibration != false) {
                    Vibration.vibrate(duration: 200);
                  }
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.mainScreens,
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.btnBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      overlayColor: const Color.fromARGB(51, 255, 255, 255)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Создать аккаунт',
                      style: GoogleFonts.nunito(
                          color: AppColors.white, fontSize: value - 2),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
