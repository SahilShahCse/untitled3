import 'package:flutter/material.dart';
import 'package:untitled3/controllers/product_controller.dart';
import 'app.dart';
import 'package:get/get.dart';

void main(){

  Get.put(ProductController(), permanent: true);

  runApp(App());

}