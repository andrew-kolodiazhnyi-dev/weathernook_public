part of 'dark_mint_blue_theme.dart';

final mintBlue = const Color(0xFF62FFCA);
const white = Color(0xffFFFDFA);
const red = Colors.red;
const darkBlue = Color.fromARGB(255, 14, 14, 33);

final outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: mintBlue,
    side: BorderSide(
      width: 2,
      color: mintBlue,
    ),
    textStyle: const TextStyle(fontSize: 18),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  ),
);

final radioThemeData = RadioThemeData(
  fillColor: WidgetStatePropertyAll<Color?>(mintBlue),
  overlayColor: WidgetStatePropertyAll<Color?>(mintBlue),
);

ThemeData _createTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.varelaRound().fontFamily,
    scaffoldBackgroundColor: darkBlue,
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
      titleSmall: TextStyle(fontSize: 22, color: mintBlue),
      bodyLarge: TextStyle(fontSize: 20, color: mintBlue),
      bodyMedium: const TextStyle(fontSize: 18, height: 1.3),
      bodySmall: TextStyle(fontSize: 18, color: mintBlue),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: white,
      onPrimary: darkBlue,
      secondary: mintBlue,
      onSecondary: darkBlue,
      error: red,
      onError: darkBlue,
      surface: darkBlue,
      onSurface: white,
    ),
  );
}
