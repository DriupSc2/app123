import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  //ThemeProvider(BuildContext context, {bool listen});

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }


}



class MyThemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff031D33),

      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.amber,
          disabledColor: Colors.black
      ),

      colorScheme: const ColorScheme(
      primary : Color(0xff085187),
      primaryVariant : Color(0xff5F4F80),
      secondary : Color(0xff085187),
      secondaryVariant : Color(0xff5060AC),
      surface : Color(0xff132A3D),
      background : Color(0xff031D33),
      error : Color(0xffcf6679),
      onPrimary : Colors.white,
      onSecondary : Colors.white,
      onSurface : Colors.white,
      onBackground : Colors.white,
      onError : Colors.black,
      brightness : Brightness.dark,
    ),
  );


  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      primary: Color(0xff08B0B0),
      primaryVariant: Color(0xff3700b3),
      secondary: Colors.white,
      secondaryVariant: Color(0xff031D33),
      surface: Colors.black,
      background: Colors.black,
      error: Color(0xffb00020),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.black,
      brightness: Brightness.light,
    )
  );

  const MyThemes();
}