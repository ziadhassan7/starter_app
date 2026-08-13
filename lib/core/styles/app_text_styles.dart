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
  static TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: FontFamily.inter.fontName
  );

  // h2 - 20 - semibold
  static TextStyle h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: FontFamily.inter.fontName
  );

  // h3 - 18 - bold
  static TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: FontFamily.inter.fontName
  );


  /// title
  // Title Large - 18 - regular
  static TextStyle title = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );

  // Title Small - 16 - regular
  static TextStyle titleSmall = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );


  /// body
  // body - 14 - regular
  static TextStyle body = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );


  /// labels
  // Label Medium - 14 - semibold
  static TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: FontFamily.inter.name
  );

  // Label Small - 12 - regular
  static TextStyle labelSmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );


  /// caption
  // Caption Medium - 12 - medium
  static TextStyle captionRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    fontFamily: FontFamily.inter.name
  );

  // Caption Small - 10 - regular
  static TextStyle captionSmall = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: FontFamily.inter.name
  );


  /// Sanchez
  // H1 - 24
  static TextStyle sanchezH1 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
      fontFamily: FontFamily.sanchez.name
  );

  // H2 - 22
  static TextStyle sanchezH2 = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
      fontFamily: FontFamily.sanchez.name
  );


  // Title - 18
  static TextStyle sanchezTitle = TextStyle(
      fontSize: 18,
      color: AppColors.text,
      fontFamily: FontFamily.sanchez.name
  );

  // Label - 12
  static TextStyle sanchezLabel = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
      fontFamily: FontFamily.sanchez.name
  );

}