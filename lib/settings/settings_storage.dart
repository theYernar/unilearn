import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SettingsStorage {
  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/settings.json';
  }

  // Сохранение значения слайдера (размера шрифта)
  Future<void> saveSliderValue(double value) async {
    final path = await _getFilePath();
    final file = File(path);
    final data = {'sliderValue': value};
    await file.writeAsString(jsonEncode(data));
  }

  // Загрузка значения слайдера (размера шрифта)
  Future<double> loadSliderValue() async {
    try {
      final path = await _getFilePath();
      final file = File(path);

      if (await file.exists()) {
        final contents = await file.readAsString();
        final data = jsonDecode(contents);
        return (data['sliderValue'] ?? 24.0).toDouble();
      }
    } catch (e) {
      print("Ошибка при загрузке настроек: $e");
    }
    return 24.0; // Значение по умолчанию
  }

   // Сохранение значения вибрации
  Future<void> saveVibrationState(bool isEnabled) async {
    final path = await _getFilePath();
    final file = File(path);

    // Чтение существующих данных
    Map<String, dynamic> data = {};
    if (await file.exists()) {
      final contents = await file.readAsString();
      data = jsonDecode(contents);
    }

    // Обновление данных
    data['vibration'] = isEnabled;
    await file.writeAsString(jsonEncode(data));
  }

  // Загрузка состояния вибрации
  Future<bool> loadVibrationState() async {
    try {
      final path = await _getFilePath();
      final file = File(path);

      if (await file.exists()) {
        final contents = await file.readAsString();
        final data = jsonDecode(contents);
        return data['vibration'] ?? false; // Значение по умолчанию — false
      }
    } catch (e) {
      print("Ошибка при загрузке состояния вибрации: $e");
    }
    return false;
  }
  
}
