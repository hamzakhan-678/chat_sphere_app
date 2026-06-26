import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = true.obs;
  final String isDarkModeThemeKey = 'darkModeThemeKey';

  final box = GetStorage();

  Future saveThemeToMemory() async {
    await box.write(isDarkModeThemeKey, isDarkMode.value);
  }

  Future toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    update();
    saveThemeToMemory();
  }

  Future getCurrentThemeFromMemory() async {
    final boolValue = box.read(isDarkModeThemeKey);
    if (boolValue != null) {
      if (boolValue == true) {
        isDarkMode.value = true;
      } else {
        isDarkMode.value = false;
      }
      update();
    }
  }

  Future applyDarkTheme() async {}

  Future applyLightTheme() async {}
}
