import 'package:flutter/material.dart';
class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text('Add', style: TextStyle(color: Colors.white),),
    );
  }
}
