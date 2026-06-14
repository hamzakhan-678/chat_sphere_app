import 'package:chat_sphere_app/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';

Widget heightSpace(double height) {
  return SizedBox(height: height);
}

Widget heightSpaceResponsive(BuildContext context, double height) {
  return SizedBox(height: screenHeight(context) * height);
}

Widget widthSpace(double width) {
  return SizedBox(width: width);
}

Widget widthSpaceResponsive(BuildContext context, double width) {
  return SizedBox(width: screenWidth(context) * width);
}
