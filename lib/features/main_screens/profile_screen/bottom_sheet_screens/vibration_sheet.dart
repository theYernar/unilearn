import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';

import '../../../../settings/settings.dart';
import '../../../../settings/settings_storage.dart';
import '../../../../theme/colors.dart';

class VibrationSheet extends StatefulWidget {
  const VibrationSheet({super.key});

  @override
  State<VibrationSheet> createState() => _VibrationSheetState();
}

class _VibrationSheetState extends State<VibrationSheet> {
  final SettingsStorage storage = SettingsStorage();

  @override
  void initState() {
    super.initState();
    _loadVibrationState();
  }

  // Загрузка состояния вибрации из JSON
  Future<void> _loadVibrationState() async {
    final savedState = await storage.loadVibrationState();
    setState(() {
      vibration = savedState;
    });
  }

  // Сохранение состояния вибрации в JSON
  Future<void> _saveVibrationState(bool value) async {
    await storage.saveVibrationState(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: globalSliderNotifier,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SizedBox(
            height: 200,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                const SizedBox(height: 25,),
                Row(
                  children: [
                    Text(
                      'Вибрация',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: value,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Switch(
                      value: vibration,
                      activeColor: AppColors.blue2,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: AppColors.blue2,
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      onChanged: (bool value) {
                        setState(() {
                          vibration = value;
                          if (value) {
                            Vibration.vibrate(); // Вибрация, если включено
                          }
                        });
                        _saveVibrationState(value); // Сохраняем новое значение
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
