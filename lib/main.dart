import 'package:adoptify/splashscreen.dart';
import 'package:adoptify/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

RxBool isDarkMode = false.obs;
final storage = GetStorage();

late String darkMapStyle;
late String lightMapStyle;

void main() async {
  await GetStorage.init();

  darkMapStyle = await rootBundle.loadString('assets/mapStyles/dark.json');
  lightMapStyle = await rootBundle.loadString('assets/mapStyles/light.json');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    isDarkMode.value = getSavedThemeMode() == ThemeMode.dark;

    return Obx(
      () => GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(0.8)),
          );
        },
        title: 'Adoptify',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }

  ThemeMode getSavedThemeMode() {
    String? savedThemeMode = storage.read('themeMode');
    switch (savedThemeMode) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }
}

void saveThemeMode(ThemeMode mode) {
  storage.write('themeMode', mode.toString());
}
