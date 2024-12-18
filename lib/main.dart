import 'package:flutter/material.dart';
import 'package:unilearn/routes/app_routes.dart';
import 'package:unilearn/theme/colors.dart';

void main() {
  runApp(const UniLearn());
}

class UniLearn extends StatelessWidget {
  const UniLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniLearn',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background
        )
      ),   
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.startScreen,
    );
  }
}