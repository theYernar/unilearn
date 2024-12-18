import 'package:flutter/material.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/settings/settings_storage.dart';
import 'package:unilearn/theme/styles.dart';

import '../../../../theme/colors.dart';

class FontSizeSheet extends StatefulWidget {
  const FontSizeSheet({super.key});

  @override
  State<FontSizeSheet> createState() => _FontSizeSheetState();
}

class _FontSizeSheetState extends State<FontSizeSheet> {
  final SettingsStorage storage = SettingsStorage();

  @override
  void initState() {
    super.initState();
    _loadSliderValue();
  }

  // Метод для загрузки значения из JSON
  Future<void> _loadSliderValue() async {
    double loadedValue = await storage.loadSliderValue();
    globalSliderNotifier.value = loadedValue;
  }

  // Метод для сохранения значения в JSON
  Future<void> _saveSliderValue(double value) async {
    await storage.saveSliderValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable:
          globalSliderNotifier, // Обработчик изменения значения слайдера
      builder: (context, value, child) {
        return SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                Text(
                  'Размер шрифта: $value',
                  style: CustomTextStyles().TitleTextStyle(value),
                ),
                const SizedBox(height: 20,),
                Slider(
                  thumbColor: AppColors.blue,
                  activeColor: AppColors.blue2,
                  inactiveColor: const Color(0xFFC5EEE0),
                  value: value,
                  min: 16,
                  max: 36,
                  divisions: 5,
                  label: value.round().toString(),
                  onChanged: (double newValue) {
                    globalSliderNotifier.value =
                        newValue; // Обновляем значение слайдера
                    _saveSliderValue(newValue); // Сохраняем новое значение в JSON
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
