import 'package:flutter/material.dart';
import 'package:unilearn/features/auth/authorization/authorization_screen.dart';
import 'package:unilearn/features/auth/registration/registration_screen.dart';
import 'package:unilearn/features/main_screens/home_screen/rank/rank_screen.dart';
import 'package:unilearn/features/main_screens/home_screen/top_users_screen/top_users_screen.dart';
import 'package:unilearn/features/main_screens/lessons_screen/my_courses/course_lessons/lesson_learn_screen/lesson_learn_screen.dart';
import 'package:unilearn/features/main_screens/lessons_screen/my_courses/course_lessons/course_lessons_screen.dart';
import 'package:unilearn/features/main_screens/lessons_screen/my_courses/course_lessons/lesson_learn_screen/test_screen/test_screen.dart';
import 'package:unilearn/features/main_screens/lessons_screen/my_courses/my_courses_screen.dart';
import 'package:unilearn/features/main_screens/main_screens.dart';
import 'package:unilearn/features/welcome_screen/settings_screens/color_scheme/color_scheme.dart';
import 'package:unilearn/features/welcome_screen/settings_screens/color_scheme/color_scheme_about/color_scheme_more_details.dart';
import 'package:unilearn/features/welcome_screen/settings_screens/fontsize_settings_screen.dart';
import 'package:unilearn/features/welcome_screen/settings_screens/mini_settings_screen.dart';
import 'package:unilearn/features/welcome_screen/start_screen.dart';
import 'package:unilearn/features/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String startScreen = '/start_screen';
  static const String welcomeScreen = '/start_screen/welcome_screen';
  static const String colorScheme = '/start_screen/welcome_screen/color_scheme';
  static const String colorSchemedMoreDetails = '/start_screen/welcome_screen/color_scheme/color_scheme_about';
  static const String fontSizeSettingsScreen =
      '/start_screen/welcome_screen/color_scheme/fontsize_settings_screen';
  static const String miniSettingsScreen =
      '/start_screen/welcome_screen/fontsize_settings_screen/mini_settings_screen';
  static const String registrationScreen =
      '/start_screen/welcome_screen/color_scheme/fontsize_settings_screen/mini_settings_screen/registration_screen';
  static const String mainScreens = '/main_screens';
  static const String authorizationScreen = '/authorization_screen';
  static const String coursesScreen = '/main_screens/my_courses_screen';
  static const String lessonsScreen =
      '/main_screens/my_courses_screen/my_lessons';
  static const String lessonLearnScreen =
      '/main_screens/my_courses_screen/my_lessons/lesson_learn_screen';
  static const String testScreen =
      '/main_screens/my_courses_screen/my_lessons/lesson_learn_screen/test_screen';
  static const String topUsersScreen = '/main_screens/top_users_screen';
  static const String rankScreen = '/main_screens/rank_screen';

  static Map<String, WidgetBuilder> routes = {
    startScreen: (context) => const StartScreen(),
    welcomeScreen: (context) => const WelcomeScreen(),
    fontSizeSettingsScreen: (context) => const FontSizeSettingsScreen(),
    colorScheme: (context) => const ColorSchemeForColorBlindPeople(),
    colorSchemedMoreDetails: (context) => const ColorSchemeAbout(),
    miniSettingsScreen: (context) => const MiniSettingsScreen(),
    registrationScreen: (context) => const RegistrationScreen(),
    authorizationScreen: (context) => const AuthorizationScreen(),
    mainScreens: (context) => const MainScreens(),
    coursesScreen: (context) => const MyCoursesScreen(),
    lessonsScreen: (context) => const MyLessonsScreen(),
    lessonLearnScreen: (context) => const LessonLearnScreen(),
    testScreen: (context) => const QuizScreen(),
    topUsersScreen: (context) => const TopUsersScreen(),
    rankScreen: (context) => RankScreen(),
  };
}
