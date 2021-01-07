import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/provider/theme_repository_provider.dart';
import '../data/repository/theme_repository.dart';
import '../gen/fonts.gen.dart';

// Color converter: https://www.w3schools.com/colors/colors_converter.asp
// Transparency list
// 100% FF
// 95%  F2
// 90%  E6
// 87%  DE
// 85%  D9
// 80%  CC
// 75%  BF
// 70%  B3
// 65%  A6
// 60%  99
// 55%  8C
// 54%  8A
// 50%  80
// 45%  73
// 40%  66
// 35%  59
// 32%  52
// 30%  4D
// 26%  42
// 25%  40
// 20%  33
// 16%  29
// 15%  26
// 12%  1F
// 10%  1A
// 5%   0D
// 0%   00

final appThemeNotifierProvider = ChangeNotifierProvider<AppTheme>(
    (ref) => AppTheme(ref.read(themeRepositoryProvider)));

const headline1 = TextStyle(
  fontSize: 24,
  fontFamily: FontFamily.rotunda,
  fontWeight: FontWeight.bold,
);

const buttonTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.white,
  fontFamily: FontFamily.rotunda,
  fontWeight: FontWeight.bold,
);

const lPrimaryColor = Color(0xffffffff);
const lSecondryColor = Color(0xff1652f0);
const lSecondryColorDark = Color(0xff002abc);
const lSecondryColorLight = Color(0xff6c7eff);
const lTextColorOnPrimary = Color(0xff000000);
const lShadowColor = Color(0x26344955);
const errorColor = Color(0xffff5544);

const cardTheme = CardTheme(
  clipBehavior: Clip.antiAlias,
  elevation: 2,
);

const colorScheme = ColorScheme(
  primary: lPrimaryColor,
  primaryVariant: lPrimaryColor,
  secondary: lSecondryColor,
  secondaryVariant: lSecondryColorLight,
  surface: Color(0xffffffff),
  background: Color(0xffffffff),
  error: errorColor,
  onPrimary: Color(0xff000000),
  onSecondary: Color(0xffffffff),
  onSurface: Color(0xff000000),
  onBackground: Color(0xff000000),
  onError: Color(0xffffffff),
  brightness: Brightness.light,
);

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme:
        GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme).copyWith(
      headline1: headline1,
    ),
    primaryColor: lPrimaryColor,
    primaryTextTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme)
        .apply(bodyColor: const Color(0xff000000)),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    primaryColorBrightness: Brightness.dark,
    accentColor: lSecondryColor,
    buttonTheme: const ButtonThemeData(
        buttonColor: lSecondryColor, textTheme: ButtonTextTheme.primary),
    cardTheme: cardTheme,
    highlightColor: lSecondryColor.withAlpha(10),
    splashColor: lSecondryColor.withAlpha(20),
    errorColor: errorColor,
    shadowColor: lShadowColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: lSecondryColorDark,
      elevation: 20.0,
    ),
    tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
          color: lSecondryColor,
          width: 2,
        ))),
    bottomAppBarColor: lSecondryColor,
  );
}

const dPrimaryColor = Color(0xff212a3b);
const dPrimaryColorDark = Color(0xff161C28);
const dPrimaryColorLight = Color(0xff4a5265);
const dSecondryColor = Color(0xff1652f0);
const dSecondryColorDark = Color(0xff002abc);
const dSecondryColorLight = Color(0xff6c7eff);
const dTextColorOnPrimary = Color(0xff000000);
const dBackgroundColor = Color(0xff272a30);
const dShadowColor = Color(0x26344955);

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: dPrimaryColor,
    primaryColorDark: dPrimaryColorDark,
    primaryColorLight: dPrimaryColorLight,
    primaryColorBrightness: Brightness.light,
    accentColor: dSecondryColor,
    scaffoldBackgroundColor: dBackgroundColor,
    buttonTheme: const ButtonThemeData(
        buttonColor: dSecondryColor, textTheme: ButtonTextTheme.primary),
    cardTheme: cardTheme,
    highlightColor: dSecondryColor.withAlpha(10),
    splashColor: dSecondryColor.withAlpha(20),
    errorColor: errorColor,
    shadowColor: dShadowColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: dSecondryColorLight,
      elevation: 20.0,
    ),
    tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ))),
    bottomAppBarColor: dPrimaryColor,
  );
}

class AppTheme extends ChangeNotifier {
  AppTheme(this._repository);

  static const _defaultThemeMode = ThemeMode.light;

  final ThemeRepository _repository;

  ThemeMode _setting;

  ThemeMode get setting => _setting;

  Future<ThemeMode> themeMode() async {
    if (setting == null) {
      _setting = await _repository.loadThemeMode() ?? _defaultThemeMode;
    }
    return setting;
  }

  Future<void> _loadLightMode() async {
    _setting = ThemeMode.light;
    await _repository.saveThemeMode(setting).whenComplete(notifyListeners);
  }

  Future<void> _loadDarkMode() async {
    _setting = ThemeMode.dark;
    await _repository.saveThemeMode(setting).whenComplete(notifyListeners);
  }

  Future<void> toggle() async {
    setting == ThemeMode.light ? await _loadDarkMode() : await _loadLightMode();
  }
}
