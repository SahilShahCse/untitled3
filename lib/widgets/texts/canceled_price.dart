import 'package:flutter/material.dart';

class CanceledPrice extends StatelessWidget {
  final String text;
  const CanceledPrice(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff84848C), decoration: TextDecoration.lineThrough),);
  }
}
