import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/screens/checkout_screen.dart';
import 'package:untitled3/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: HomeScreen(),
    );
  }
}
