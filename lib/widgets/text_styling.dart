import 'package:flutter/material.dart';

class TextStyles extends StatelessWidget {
  const TextStyles({
    super.key,
    required this.text,
    required this.fontSize,
    required this.appColor,
  });
  final String text;
  final double fontSize;
  final Color appColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: appColor,
      ),
    );
  }
}
