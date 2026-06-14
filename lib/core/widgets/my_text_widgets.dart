import 'package:flutter/material.dart';

// Text Widget For Large Bold Titles, AppBar
class MyTitleText extends StatelessWidget {
  const MyTitleText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.overflow,
    this.decoration,
    this.decorationColor,
    this.maxLines,
    this.textAlign,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 22,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        letterSpacing: letterSpacing,
        overflow: overflow,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}

// Text Widget For Normal Size Bold Headings + Titles
class MyHeadingText extends StatelessWidget {
  const MyHeadingText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.overflow,
    this.decoration,
    this.decorationColor,
    this.maxLines,
    this.textAlign,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        letterSpacing: letterSpacing,
        overflow: overflow,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}

// Text Widget For Descriptions and Body Text
class MyBodyText extends StatelessWidget {
  const MyBodyText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.overflow,
    this.decoration,
    this.decorationColor,
    this.maxLines,
    this.textAlign,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
        letterSpacing: letterSpacing,
        overflow: overflow,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}

// Text Widget For Hint and Small Labels
class MyHintText extends StatelessWidget {
  const MyHintText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.overflow,
    this.decoration,
    this.decorationColor,
    this.maxLines,
    this.textAlign,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Theme.of(context).shadowColor,
        letterSpacing: letterSpacing,
        overflow: overflow,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
