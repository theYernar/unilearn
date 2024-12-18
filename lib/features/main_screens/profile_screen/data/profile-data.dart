import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/features/main_screens/profile_screen/bottom_sheet_screens/email_sheet.dart';
import 'package:unilearn/features/main_screens/profile_screen/bottom_sheet_screens/fontsize_sheet.dart';
import 'package:unilearn/features/main_screens/profile_screen/bottom_sheet_screens/vibration_sheet.dart';

import '../bottom_sheet_screens/support_sheet.dart';

class Date {
  final IconData icon;
  final String text;
  final bool isButton;
  final sheet;

  Date({required this.icon, required this.text, required this.isButton, required this.sheet});
}

List<Date> userInformation = [
  Date(
    icon: HugeIcons.strokeRoundedMortarboard01,
    text: 'Студент',
    isButton: false,
    sheet: const VibrationSheet(),
  ),
  Date(
    icon: HugeIcons.strokeRoundedMail01,
    text: 'email@email.com',
    isButton: true,
    sheet: const EmailSheet(),
  ),
  Date(
    icon: HugeIcons.strokeRoundedUserGroup, 
    text: 'П22-3Б', 
    isButton: false,
    sheet: const VibrationSheet(),
  )
];

List<Date> settings = [
  Date(
    icon: HugeIcons.strokeRoundedTextFont,
    text: 'Размер шрифта',
    isButton: true,
    sheet: const FontSizeSheet(),
  ),
  Date(
    icon: HugeIcons.strokeRoundedSmartPhone03,
    text: 'Вибрация',
    isButton: true,
    sheet: const VibrationSheet(),
  ),
];

List<Date> support = [
  Date(
    icon: HugeIcons.strokeRoundedCustomerService01,
    text: 'Тех. поддержка',
    isButton: true,
    sheet: const SupportSheet(),
  ),
];

List<Date> logout = [
  Date(
    icon: HugeIcons.strokeRoundedLogout03,
    text: 'Выйти из аккаунта',
    isButton: false,
    sheet: false,
  ),
];
