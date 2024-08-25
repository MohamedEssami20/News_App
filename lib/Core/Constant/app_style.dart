import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle semiBold20(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 20),
        color: const Color(0xffFFFFFF),
        fontWeight: FontWeight.w600);
  }

  static TextStyle regular16(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 16),
        color: const Color(0xFF7D7878),
        fontWeight: FontWeight.w500);
  }

  static TextStyle regular20(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 20),
        color: const Color(0xffEBEBEB),
        fontWeight: FontWeight.w800);
  }

  static TextStyle regular25(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 25),
        color: const Color(0xffEBEBEB),
        fontWeight: FontWeight.w800);
  }

  static TextStyle bold14(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 14),
        color: const Color(0xffFFFFFF),
        fontWeight: FontWeight.w700);
  }

  static TextStyle bold25(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 25),
        color: const Color(0xffFFFFFF),
        fontWeight: FontWeight.w700);
  }

  static TextStyle bold35(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 35),
        color: const Color(0xffFFFFFF),
        fontWeight: FontWeight.w700);
  }

  static TextStyle medium18(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 18),
        color: const Color.fromARGB(255, 225, 225, 225),
        fontWeight: FontWeight.w500);
  }

  static TextStyle regular12(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 12),
        color: const Color(0xff7D7878),
        fontWeight: FontWeight.w400);
  }
}

double getResponsiveFont(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveText = scaleFactor * fontSize;
  double upperLimit = responsiveText * 1.4;
  double lowerLimit = responsiveText * 0.9;
  return responsiveText.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 850) {
    return width / 500;
  } else if (width < 1500) {
    return width / 1200;
  } else {
    return width / 1800;
  }
}
