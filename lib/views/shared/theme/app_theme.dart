// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../core/helpers/resources.dart';

ThemeData appThemeLight() {
  final colorScheme = ColorScheme.light(
    primary: R.colors.lightPrimaryColor,
    secondary: R.colors.lightSecondaryColor,
    tertiary: R.colors.lightTertiaryColor,
    error: R.colors.redError,
    outline: R.colors.lightBorderColor,
    background: R.colors.lightPrimaryBackgroundColor,
    surface: R.colors.lightSecondaryBackgroundColor,
  );

  final textTheme = TextTheme(
    // button
    labelLarge: TextStyle(
      fontFamily: "Roboto",
      fontSize: R.fontSize.fs14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: R.colors.lightPrimaryColor,
    ),
    // caption
    bodySmall: TextStyle(
      fontFamily: "Roboto",
      fontSize: R.fontSize.fs12,
      fontWeight: FontWeight.w400,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 0.4,
    ),
    // overline
    labelSmall: TextStyle(
      fontFamily: "Roboto",
      fontSize: R.fontSize.fs10,
      fontWeight: FontWeight.w400,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Roboto",
      fontSize: R.fontSize.fs14,
      fontWeight: FontWeight.w400,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 0.25,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Roboto",
      fontSize: R.fontSize.fs16,
      fontWeight: FontWeight.w400,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 0.5,
    ),
    titleSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: R.fontSize.fs13,
      fontWeight: FontWeight.w500,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 0.1,
    ),
    titleMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: R.fontSize.fs16,
      fontWeight: FontWeight.w400,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 0.15,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: R.fontSize.fs19,
      fontWeight: FontWeight.w500,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 0.15,
    ),
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: R.fontSize.fs23,
      fontWeight: FontWeight.w400,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 0,
    ),
    headlineLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: R.fontSize.fs33,
      fontWeight: FontWeight.w400,
      color: R.colors.lightPrimaryColor,
      letterSpacing: 0.25,
    ),
  );

  // final inputTheme = InputDecorationTheme(
  //   focusedErrorBorder: UnderlineInputBorder(
  //     borderRadius: const BorderRadius.all(Radius.circular(8)),
  //     borderSide: BorderSide(width: 4, color: R.colors.blueInfo),
  //   ),
  //   labelStyle: textTheme.bodyMedium!.copyWith(
  //     fontSize: R.fontSize.fs16,
  //     fontWeight: FontWeight.w300,
  //   ),
  //   isDense: false,
  //   contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //   fillColor: R.colors.blueInfo,
  //   hoverColor: Colors.transparent,
  //   filled: true,
  //   focusedBorder: UnderlineInputBorder(
  //       borderRadius: const BorderRadius.all(Radius.circular(8)),
  //       borderSide: BorderSide(color: R.colors.blueInfo, width: 4)),
  //   enabledBorder: OutlineInputBorder(
  //     borderSide: BorderSide(width: 1, color: R.colors.blueInfo),
  //     borderRadius: const BorderRadius.all(
  //       Radius.circular(8),
  //     ),
  //   ),
  // );

  return ThemeData(
    // Colors
    cardColor: R.colors.lightSecondaryBackgroundColor,
    primaryColor: R.colors.lightPrimaryColor,
    scaffoldBackgroundColor: R.colors.lightPrimaryBackgroundColor,
    secondaryHeaderColor: R.colors.lightTitleTextColor,
    disabledColor: R.colors.lightDisabledInputColor,
    dividerColor: R.colors.lightBorderColor,
    canvasColor: Colors.transparent,

    textTheme: textTheme,
  );
}

ThemeData appThemeDark() {
  final colorScheme = ColorScheme.dark(
    primary: R.colors.darkPrimaryColor,
    secondary: R.colors.darkSecondaryColor,
    tertiary: R.colors.darkTertiaryColor,
    error: R.colors.redError,
    outline: R.colors.darkBorderColor,
    background: R.colors.darkPrimaryBackgroundColor,
    surface: R.colors.darkSecondaryBackgroundColor,
  );

  final textTheme = TextTheme(
    titleMedium: TextStyle(
      fontSize: R.fontSize.fs16,
      fontWeight: FontWeight.w500,
      color: R.colors.darkBorderColor,
    ),
    bodyMedium: TextStyle(
      fontSize: R.fontSize.fs16,
      fontWeight: FontWeight.w500,
      color: R.colors.darkBorderColor,
    ),
    displayMedium: TextStyle(
      fontSize: R.fontSize.fs12,
      fontWeight: FontWeight.w400,
      color: R.colors.darkBorderColor,
    ),
  );

  return ThemeData(
    // Colors
    cardColor: R.colors.darkSecondaryBackgroundColor,
    primaryColor: R.colors.darkPrimaryColor,
    scaffoldBackgroundColor: R.colors.darkPrimaryBackgroundColor,
    secondaryHeaderColor: R.colors.darkTitleTextColor,
    disabledColor: R.colors.darkDisabledInputColor,
    dividerColor: R.colors.darkBorderColor,
    canvasColor: Colors.transparent,

    textTheme: textTheme,
  );
}
