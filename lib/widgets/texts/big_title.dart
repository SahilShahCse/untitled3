import 'package:flutter/material.dart';

class BigTitle extends StatelessWidget {
  final String text;
  const BigTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),);
  }
}
