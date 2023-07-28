import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStroge = GetStorage();
  final key = 'isDarkModes';

  saveThemeDataInBox(bool isDark) {
    boxStroge.write(key, isDark);
  }

  bool getThemeDataFromBox() {
    return boxStroge.read<bool>(key) ?? false;
  }

  ThemeMode get ThemeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void ChangesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);

    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
