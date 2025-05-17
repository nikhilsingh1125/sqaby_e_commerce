import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle customTextStyle({
  required double fontSize,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
  TextDecoration decoration = TextDecoration.none,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    fontFamily: fontFamily,
  );
}
