import 'package:college_management_app/src/package/resorces/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resorces/size.dart';

abstract class AppTheme {
  static const defaultFontFamily = "PlusJakartaSans";

  static ThemeData get lightTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryBlue,
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFFFFF),
      inversePrimary: Color(0x1AFFFFFF),
      secondary: Color(0xFF20002C),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFF2F2F2),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF131212),
      surfaceContainerLowest: Color(0xFFE4DFDF),
      surfaceContainerHighest: Color(0xFFF8F8F8),
      surfaceDim: Color(0xFF838284),
      onSurfaceVariant: Color(0xFF838284),
      error: Color(0xFFFF3B30),
      onError: Color(0xFFFFFFFF),
      outline: Color(0xFFE4DFDF),
      outlineVariant: Color(0xFFD9D9D9),
      tertiary: Color(0xFFFFFFFF),
    );
    return _getThemeData(colorScheme);
  }

  static ThemeData get darkTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF3B82F6),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0x1AFFFFFF),
      inversePrimary: Color(0x1AFFFFFF),
      secondary: Color(0xFF555DFD),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFF18212F),
      surface: Color(0x0AFFFFFF),
      onSurface: Color(0xFFFFFFFF),
      surfaceContainer: Color(0xFF1E1F23),
      surfaceContainerLow: Color(0x0AFFFFFF),
      surfaceContainerLowest: Color(0xFF262D34),
      surfaceContainerHighest: Color(0x0AFFFFFF),
      surfaceDim: Color(0xFF848486),
      onSurfaceVariant: Color(0xFF777B95),
      error: Color(0xFFFF3B30),
      onError: Color(0xFFFFFFFF),
      outline: Color(0x0AFFFFFF),
      outlineVariant: Color(0x33FFFFFF),
      tertiary: Color(0xFFFFFFFF),
    );
    return _getThemeData(colorScheme);
  }

  static ThemeData _getThemeData(ColorScheme colorScheme) {
    return ThemeData(
      fontFamily: defaultFontFamily,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      visualDensity: VisualDensity.standard,
      dividerColor: colorScheme.outlineVariant,
      scaffoldBackgroundColor: _scaffoldBackgroundColor(colorScheme),
      appBarTheme: _getAppBarTheme(colorScheme),
      textTheme: _textTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      elevatedButtonTheme: _elevatedButtonThemeData(colorScheme),
      outlinedButtonTheme: _outlinedButtonThemeData(colorScheme),
      textButtonTheme: _textButtonThemeData(colorScheme),
      dialogTheme: _dialogTheme(colorScheme),
      listTileTheme: _listTileThemeData(colorScheme),
      datePickerTheme: _datePickerTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      bottomNavigationBarTheme: _bottomNavigationBarThemeData(colorScheme),
    );
  }

  static TextTheme _textTheme(ColorScheme colorScheme) {
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    );
  }

  static Color _scaffoldBackgroundColor(ColorScheme color) =>
      color.brightness == Brightness.dark ? Colors.transparent : color.surface;

  static AppBarTheme _getAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: colorScheme.onSurface,
      titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: colorScheme.brightness,
        statusBarIconBrightness: ThemeData.estimateBrightnessForColor(colorScheme.onSurface),
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  static _inputDecorationTheme(ColorScheme colorScheme) {
    final border = OutlineInputBorder(
      borderRadius: ShapeBorderRadius.medium,
      borderSide: BorderSide(color: colorScheme.outline),
    );

    final iconColor = WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.error)) return colorScheme.error;
      if (states.contains(WidgetState.focused)) return colorScheme.primary;
      return colorScheme.onSurfaceVariant;
    });

    return InputDecorationTheme(
      errorMaxLines: 3,
      helperMaxLines: 3,
      filled: true,
      hintStyle: TextStyle(color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w500),
      errorStyle: const TextStyle(fontWeight: FontWeight.w500),
      helperStyle: const TextStyle(fontWeight: FontWeight.w500),
      contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.normal, vertical: Spacing.normal),
      border: border,
      disabledBorder: border,
      enabledBorder: border,
      suffixIconColor: iconColor,
      prefixIconColor: iconColor,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }

  static const ButtonStyle _commonButtonStyle = ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: ShapeBorderRadius.medium),
    ),
    minimumSize: WidgetStatePropertyAll(Size(76, 32)),
  );

  static ElevatedButtonThemeData _elevatedButtonThemeData(ColorScheme colorScheme) => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.primary.withOpacity(0.5),
          disabledForegroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: Spacing.normal, horizontal: Spacing.large),
        ).merge(_commonButtonStyle),
      );

  static OutlinedButtonThemeData _outlinedButtonThemeData(ColorScheme colorScheme) => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
          disabledBackgroundColor: colorScheme.surface,
          disabledForegroundColor: colorScheme.onSurfaceVariant,
          side: BorderSide(color: colorScheme.surfaceContainerHighest),
          padding: const EdgeInsets.symmetric(vertical: Spacing.normal, horizontal: Spacing.large),
        ).merge(_commonButtonStyle),
      );

  static TextButtonThemeData _textButtonThemeData(ColorScheme colorScheme) => TextButtonThemeData(
        style: TextButton.styleFrom(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          padding: const EdgeInsets.symmetric(vertical: Spacing.xSmall, horizontal: Spacing.xSmall),
          shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.small),
        ).merge(_commonButtonStyle),
      );

  static DialogTheme _dialogTheme(ColorScheme colorScheme) => DialogTheme(
        backgroundColor: colorScheme.surfaceContainer,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: ShapeBorderRadius.medium,
          side: BorderSide.none,
        ),
      );

  static ListTileThemeData _listTileThemeData(ColorScheme colorScheme) => ListTileThemeData(
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.medium),
        contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: Spacing.normal),
        tileColor: colorScheme.surfaceContainerHighest,
      );

  static DatePickerThemeData _datePickerTheme(ColorScheme colorScheme) {
    return DatePickerThemeData(
      backgroundColor: colorScheme.brightness == Brightness.light ? null : const Color(0xff1E1F23),
      rangePickerBackgroundColor: colorScheme.surfaceContainer,
      shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.normal),
      rangePickerHeaderForegroundColor: colorScheme.onSurface,
    );
  }

  static CardTheme _cardTheme(ColorScheme colorScheme) => CardTheme(
        color: colorScheme.brightness == Brightness.light ? colorScheme.surfaceContainerHighest : colorScheme.surface,
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.medium),
        elevation: 0,
      );

  static BottomNavigationBarThemeData _bottomNavigationBarThemeData(
    ColorScheme colorScheme,
  ) {
    return BottomNavigationBarThemeData(
      backgroundColor: colorScheme.secondaryContainer,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }
}
