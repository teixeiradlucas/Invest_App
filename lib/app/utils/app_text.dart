import 'package:flutter/material.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';
import 'package:invest_app/app/utils/themes/app_fonts.dart';

class AppText {
  static Text h1(
    String text, {
    Color color = AppColors.whiteColor,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 26,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: color,
      ),
      maxLines: 3,
      textAlign: TextAlign.center,
    );
  }

  static Text h2(
    String text, {
    Color color = AppColors.whiteColor,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: color,
      ),
      maxLines: 2,
      textAlign: TextAlign.start,
    );
  }

  static Text body(
    String text, {
    Color color = AppColors.whiteColor,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFonts.inter,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: color,
      ),
      textAlign: TextAlign.start,
    );
  }

  static Text detail(
    String text,
  ) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      textAlign: TextAlign.start,
    );
  }

  static Text bodyPositiveValue(
    String text, {
    Color color = AppColors.greenColor,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFonts.inter,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: color,
      ),
      textAlign: TextAlign.start,
    );
  }

  static Text bodyNegativeValue(
    String text, {
    Color color = AppColors.redColor,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFonts.inter,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: color,
      ),
      textAlign: TextAlign.start,
    );
  }
}
