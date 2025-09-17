import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final bool isHighlighted;
  const BodyText(this.text, {super.key, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: isHighlighted? Color(0xff434347) : null),);
  }
}
