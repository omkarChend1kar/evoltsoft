import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF2862B4), // Main
  onPrimary: Color(0xFFFFFFFF), // White
  primaryContainer: Color(0xFFCAD8EC), // Main-3
  onPrimaryContainer: Color(0xFF1D1D1D), // Dark
  primaryFixed: Color(0xFF97B2DB), // Main-2
  primaryFixedDim: Color(0xFF668EC9), // Main-1
  onPrimaryFixed: Color(0xFFFFFFFF), // White
  onPrimaryFixedVariant: Color(0xFF2C2C2C), // Main Text

  secondary: Color(0xFF668EC9), // Gray
  onSecondary: Color(0xFF1D1D1D), // Dark
  secondaryContainer: Color(0xFFEDEDED), // Gray Light
  onSecondaryContainer: Color(0xFF2C2C2C), // Main Text
  secondaryFixed: Color(0xFFDFE7F4), // Main-4
  secondaryFixedDim: Color(0xFFF8AFD), // Main-5
  onSecondaryFixed: Color(0xFF1D1D1D), // Dark
  onSecondaryFixedVariant: Color(0xFF2C2C2C), // Main Text

  tertiary: Color(0xFF8A8A8A), // Small Text
  onTertiary: Color(0xFFFFFFFF), // White
  tertiaryContainer: Color(0xFFA8A8A8), // Slightly lighter gray
  onTertiaryContainer: Color(0xFF1D1D1D), // Dark

  error: Color(0xFFF4462C), // Error
  onError: Color(0xFFFFFFFF), // White
  errorContainer: Color(0xFFFFE1E1), // Light red shade
  onErrorContainer: Color(0xFF1D1D1D), // Dark

  surface: Color(0xFFF8FAFD), // White
  onSurface: Color(0xFF2C2C2C), // Main Text
  surfaceDim: Color(0xFFF8F8F8), // Soft white
  surfaceBright: Color(0xFFFFFFFF), // White
  surfaceContainerLowest: Color(0xFFF5F5F5), // Slight gray tint
  surfaceContainerLow: Color(0xFFEDEDED), // Gray Light
  surfaceContainer: Color(0xFFDCDCDC), // Light gray
  surfaceContainerHigh: Color(0xFFC5C8C7), // Gray
  // surfaceContainerHighest: Color(0xFF8A8A8A), // Small Text
  onSurfaceVariant: Color(0xFF8A8A8A), // Small Text
  outline: Color(0xFF8A8A8A), // Small Text
  outlineVariant: Color(0xFFC5C8C7), // Gray
  shadow: Color(0xFF1D1D1D), // Dark
  scrim: Color(0xFF000000), // Black
  inverseSurface: Color(0xFF2C2C2C), // Main Text
  onInverseSurface: Color(0xFFFFFFFF), // White
  inversePrimary: Color(0xFF2862B4), // Main
  surfaceTint: Color(0xFF2862B4), // Main
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF2B62B4), // Main -1,
  onPrimary: Color(0xFF1D1D1D), // Dark
  primaryContainer: Color(0xFF97B2DB), // Main-1
  onPrimaryContainer: Color(0xFFFFFFFF), // White
  primaryFixed: Color(0xFFCAD8EC), // Main-3
  primaryFixedDim: Color(0xFFDFE7F4), // Main-4
  onPrimaryFixed: Color(0xFF1D1D1D), // Dark
  onPrimaryFixedVariant: Color(0xFF2C2C2C), // Main Text

  secondary: Color(0xFFC668EC9), // Gray
  onSecondary: Color(0xFF1D1D1D), // Dark
  secondaryContainer: Color(0xFFEDEDED), // Gray Light
  onSecondaryContainer: Color(0xFF2C2C2C), // Main Text
  secondaryFixed: Color(0xFFDFE7F4), // Main-4
  secondaryFixedDim: Color(0xFFF8AFD), // Main-5
  onSecondaryFixed: Color(0xFF1D1D1D), // Dark
  onSecondaryFixedVariant: Color(0xFF2C2C2C), // Main Text

  tertiary: Color(0xFF8A8A8A), // Small Text
  onTertiary: Color(0xFFFFFFFF), // White
  tertiaryContainer: Color(0xFFA8A8A8), // Slightly lighter gray
  onTertiaryContainer: Color(0xFF1D1D1D), // Dark

  error: Color(0xFFF4462C), // Error
  onError: Color(0xFFFFFFFF), // White
  errorContainer: Color(0xFFFFE1E1), // Light red shade
  onErrorContainer: Color(0xFF1D1D1D), // Dark

  surface: Color(0xFF2C2C2C), // Main Text
  onSurface: Color(0xFFFFFFFF), // White
  surfaceDim: Color(0xFF1D1D1D), // Dark
  surfaceBright: Color(0xFF3C3C3C), // Slightly lighter dark
  surfaceContainerLowest: Color(0xFF1D1D1D), // Dark
  surfaceContainerLow: Color(0xFF2C2C2C), // Main Text
  surfaceContainer: Color(0xFF3C3C3C), // Slightly lighter dark
  surfaceContainerHigh: Color(0xFF4C4C4C), // Darker gray
  // surfaceContainerHighest: Color(0xFF8A8A8A), // Small Text
  onSurfaceVariant: Color(0xFF8A8A8A), // Small Text
  outline: Color(0xFF8A8A8A), // Small Text
  outlineVariant: Color(0xFFC5C8C7), // Gray
  shadow: Color(0xFF000000), // Black
  scrim: Color(0xFF000000), // Black
  inverseSurface: Color(0xFFFFFFFF), // White
  onInverseSurface: Color(0xFF2C2C2C), // Main Text
  inversePrimary: Color(0xFF2862B4), // Main
  surfaceTint: Color(0xFF2862B4), // Main
);

class AppTheme {
  TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.lato(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.lato(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.lato(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: lightColorScheme.onSurfaceVariant,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelLarge: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.lato(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  /// Light Theme
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF2B62B4),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    cardColor: Color(0xFFEDEDED),
    dividerColor: Color(0xFFC5C6C7),
    disabledColor: Color(0xFF8A8A8A),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2C2C2C),
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2C2C2C),
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xFF2C2C2C),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Color(0xFF2C2C2C),
      ), // Main Text
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: lightColorScheme.onSurfaceVariant,
      ), // Small Text
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFFFAFAFA),
      ), // Small Text 2
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFFFFFFFF),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF2B62B4),
      foregroundColor: Colors.white,
      elevation: 16.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      hoverColor: Color(0xFF1A4D8F), // Darker blue on hover
      focusColor: Color(0xFF1A4D8F),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFEDEDED),
      selectedItemColor: Color(0xFF2B62B4),
      unselectedItemColor: Color(0xFF8A8A8A),
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 8.0,
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      foregroundColor: Color(0xFF2B62B4),
      elevation: 2,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2B62B4),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xFF2B62B4),
        side: BorderSide(color: Color(0xFF2B62B4)),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF2B62B4),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: Color(0xFFF8FAFD),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xFF2B62B4)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xFFF4462C)),
      ),
      hintStyle: TextStyle(color: Color(0xFF8A8A8A)),
    ),

    // SnackBar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Color(0xFF2B62B4),
      contentTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      behavior: SnackBarBehavior.floating,
    ),

    // Icon Theme
    iconTheme: IconThemeData(color: Color(0xFF2C2C2C), size: 24),

    // Color Scheme
    colorScheme: lightColorScheme,
  );

  ///Dark Theme
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF2B62B4),
    scaffoldBackgroundColor: Color(0xFF1D1D1D),
    cardColor: Color(0xFF2C2C2C),
    dividerColor: Color(0xFFC5C6C7),
    disabledColor: Color(0xFF8A8A8A),

    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.lato(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: lightColorScheme.onSurfaceVariant,
      ),
      bodySmall: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelLarge: GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelMedium: GoogleFonts.lato(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF2B62B4),
      foregroundColor: Colors.white,
      elevation: 16.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      hoverColor: Color(0xFF668EC9), // Slightly lighter blue on hover
      focusColor: Color(0xFF668EC9),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1D1D1D),
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xFF2B62B4)),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2C2C2C),
      selectedItemColor: Color(0xFF2B62B4),
      unselectedItemColor: Color(0xFFC5C6C7),
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 8.0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2B62B4),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2C2C2C),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xFF2B62B4)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xFFF4462C)),
      ),
      hintStyle: TextStyle(color: Color(0xFF8A8A8A)),
    ),

    snackBarTheme: SnackBarThemeData(backgroundColor: Color(0xFF2B62B4)),

    iconTheme: IconThemeData(color: Color(0xFFFFFFFF), size: 24),

    colorScheme: darkColorScheme,
  );
}
