import 'package:flutter/material.dart';
import 'colors.dart';
import 'utils.dart';

class AppTextStyles {
  // Tab
  static const tabBarTextStyle = const TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w900,
    fontFamily: AppFonts.secondaryFont,
  );

  // Form
  static const formLabelTextStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    color: CustomColors.formLabelTextColor,
  );

  static const textFieldTextStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    color: CustomColors.primaryDarkColor,
  );

  // Button
  static const btnTextStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: AppFonts.secondaryFont,
    color: Colors.white,
  );

  static const btnInverseTextStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: AppFonts.secondaryFont,
    color: Colors.black,
  );

  static const headerTextTextStyle = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
    fontFamily: AppFonts.secondaryFont,
    color: CustomColors.primaryDarkColor
  );
}
