import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  const SubtitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: 1, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff71717A)),);
  }
}
