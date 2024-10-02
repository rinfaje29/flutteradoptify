import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      //
      fontFamily: GoogleFonts.montserrat().fontFamily,
      //snas serif
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        background: Color(0xFFF1F3F4),
        secondary: secondaryColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: scafoldColor,
      cardColor: cardColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: whiteColor),
      iconTheme: IconThemeData(color: textPrimaryColorGlobal),
      textTheme: GoogleFonts.montserratTextTheme(),
      //sans-serif
      dialogBackgroundColor: Colors.white,
      unselectedWidgetColor: Colors.black,
      dividerColor: borderColor.withOpacity(0.5),
      switchTheme: SwitchThemeData(trackOutlineColor: MaterialStateProperty.all(Colors.transparent), trackColor: MaterialStateProperty.all(switchActiveTrackColor.withOpacity(0.3)), thumbColor: MaterialStateProperty.all(switchActiveTrackColor)),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: defaultRadius, topRight: defaultRadius)),
        backgroundColor: whiteColor,
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: scafoldColor,
        ),
      ),
      dialogTheme: DialogTheme(shape: dialogShape()),
      pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: createMaterialColor(primaryColor),
      primaryColor: primaryColor,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(primary: cardColor, onPrimary: primaryColor, onSurface: cardColor, brightness: Brightness.dark),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: scaffoldDarkColor,
          statusBarBrightness: Brightness.light,
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        dayPeriodTextColor: white,
        helpTextStyle: TextStyle(color: white),
      ),
      scaffoldBackgroundColor: scaffoldDarkColor,
      //
      fontFamily: GoogleFonts.montserrat().fontFamily,
      //sans-serif
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: scaffoldSecondaryDark),
      iconTheme: IconThemeData(color: white),
      textTheme: GoogleFonts.montserratTextTheme(),
      //sans-serif
      dialogBackgroundColor: scaffoldSecondaryDark,
      unselectedWidgetColor: Colors.white60,
      useMaterial3: true,
      bottomSheetTheme: BottomSheetThemeData(shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: defaultRadius, topRight: defaultRadius)), backgroundColor: scaffoldDarkColor),
      dividerColor: borderColor.withOpacity(0.2),
      cardColor: cardDarkColor,
      dialogTheme: DialogTheme(shape: dialogShape()),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
