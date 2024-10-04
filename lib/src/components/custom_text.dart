import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? colorName;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final double? height;
  final TextOverflow? textOverflow;

  const CustomText({
    super.key,
    required this.title,
    required this.fontSize,
    this.colorName,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
    this.letterSpacing,
    this.height,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        overflow: textOverflow,
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: colorName,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      ),
      textAlign: textAlign,
    );
  }
}
