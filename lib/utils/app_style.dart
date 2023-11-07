import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class CustomTextStyle {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 24,
    color: Colors.green,
    fontWeight: FontWeight.bold,
  );
}

class textStyle {
  static TextStyle title = GoogleFonts.inter(
    fontSize: 20,
    color: Color(0xff121212),
    fontWeight: FontWeight.w400,
  );

  static TextStyle description = GoogleFonts.inter(
    color: Color(0xff7d7f86),
    fontSize: 16,
  );

  static TextStyle heading = GoogleFonts.inter(
      decorationColor: AppColor.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColor.orange);

  // final heading = TextStyle(
  //     decorationColor: AppColor.white,
  //     fontSize: 22,
  //     fontFamily: 'FontsFree',
  //     fontWeight: FontWeight.w600,
  //     color: AppColor.orange);

  final textform = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey.shade500);

  final subtitle = const TextStyle(
    color: Color(0xff121212),
    fontSize: 15,
    fontFamily: 'FontsFree',
  );

  final text = TextStyle(
      decorationColor: AppColor.white,
      fontSize: 16,
      fontFamily: 'FontsFree',
      color: Colors.white);

  final texts = TextStyle(
      decorationColor: AppColor.white,
      fontSize: 16,
      fontFamily: 'FontsFree',
      color: AppColor.orange);
}
