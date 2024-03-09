import 'package:flutter/material.dart';

abstract class Constants {
  static double height(context) => MediaQuery.of(context).size.height;
  static double width(context) => MediaQuery.of(context).size.width;
  static pheight08(context) => SizedBox(height: height(context) * 0.08);
  static pheight02(context) => SizedBox(height: height(context) * 0.02);
  static pheight03(context) => SizedBox(height: height(context) * 0.03);
  static pheight04(context) => SizedBox(height: height(context) * 0.04);
  static pheight10(context) => SizedBox(height: height(context) * 0.10);
  static pheight15(context) => SizedBox(height: height(context) * 0.15);
  static pheight01(context) => SizedBox(height: height(context) * 0.01);
}
