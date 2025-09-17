import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final String text;
  const PriceText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),);
  }
}
