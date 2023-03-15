import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.label,
      this.color,
      this.fontWeight,
      this.fontSize = 18});
  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    var encoded = utf8.encode(label);
    var decoded = utf8.decode(encoded);
    return Text(
      decoded,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w500),
    );
  }
}
