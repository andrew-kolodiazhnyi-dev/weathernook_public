part of 'dark_yellow_theme.dart';

final yellow = Colors.amber.shade600;
const white = Color(0xffFFFDFA);
const red = Colors.red;
const black = Color(0xff121212);

final outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: yellow,
    side: BorderSide(
      width: 2,
      color: yellow,
    ),
    textStyle: const TextStyle(fontSize: 18),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  ),
);

final radioThemeData = RadioThemeData(
  fillColor: WidgetStatePropertyAll<Color?>(yellow),
  overlayColor: WidgetStatePropertyAll<Color?>(yellow),
);

ThemeData _createTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.varelaRound().fontFamily,
    scaffoldBackgroundColor: black,
    primaryColor: white,
    useMaterial3: true,
    outlinedButtonTheme: outlinedButtonThemeData,
    radioTheme: radioThemeData,
    textTheme: TextTheme(
      headlineMedium: const TextStyle(
        fontSize: 34,
        color: white,
      ),
      headlineSmall: const TextStyle(fontSize: 28),
      titleLarge: const TextStyle(
        fontSize: 28,
        letterSpacing: 1,
        height: 1,
        color: white,
      ),
      titleMedium: const TextStyle(fontSize: 24),
      titleSmall: TextStyle(fontSize: 22, color: yellow),
      bodyLarge: TextStyle(fontSize: 20, color: yellow),
      bodyMedium: const TextStyle(fontSize: 18, height: 1.3),
      bodySmall: TextStyle(fontSize: 18, color: yellow),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: white,
      onPrimary: black,
      secondary: yellow,
      onSecondary: black,
      error: red,
      onError: black,
      surface: black,
      onSurface: white,
    ),
  );
}
