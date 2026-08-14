import 'package:flutter/material.dart';
import 'app_colors.dart';


enum FontFamily {
  inter,
  sanchez;

  String get fontName {
    switch (this) {
      case FontFamily.inter:
        return "Inter";
      case FontFamily.sanchez:
        return "Sanchez";
    }
  }
}

class AppTextStyles {

  /// headlines
  // h1 - 24 - bold
  static TextStyle get h1 => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: FontFamily.inter.fontName
  );

  // h2 - 20 - semibold
  static TextStyle get h2 => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: FontFamily.inter.fontName
  );

  // h3 - 18 - bold
  static TextStyle get h3 => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: FontFamily.inter.fontName
  );


  /// title
  // Title Large - 18 - regular
  static TextStyle get title => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );

  // Title Small - 16 - regular
  static TextStyle get titleSmall => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );


  /// body
  // body - 14 - regular
  static TextStyle get body => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );


  /// labels
  // Label Medium - 14 - semibold
  static TextStyle get labelMedium => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: FontFamily.inter.name
  );

  // Label Small - 12 - regular
  static TextStyle get labelSmall => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );


  /// caption
  // Caption Medium - 12 - medium
  static TextStyle get captionRegular => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    fontFamily: FontFamily.inter.name
  );

  // Caption Small - 10 - regular
  static TextStyle get captionSmall => TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );


  /// Sanchez
  // H1 - 24
  static TextStyle get sanchezH1 => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
      fontFamily: FontFamily.sanchez.name
  );

  // H2 - 22
  static TextStyle get sanchezH2 => TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
      fontFamily: FontFamily.sanchez.name
  );


  // Title - 18
  static TextStyle get sanchezTitle => TextStyle(
      fontSize: 18,
      color: AppColors.text,
      fontFamily: FontFamily.sanchez.name
  );

  // Label - 12
  static TextStyle get sanchezLabel => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
      fontFamily: FontFamily.sanchez.name
  );

}

// We make `static TextStyle get h1`: because this is a getter function
// and it dynamically gets the correct object based on isDark value
//
// instead of `static TextStyle h1 =`: which stores a static variable in memory
// so it doesn't change dynamically