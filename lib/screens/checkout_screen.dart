import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:untitled3/controllers/cart_controller.dart';
import 'package:untitled3/widgets/item_card_checkout.dart';
import 'package:get/get.dart';
import 'package:untitled3/widgets/texts/big_title.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar(),
              SizedBox(height: 44),
              Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCardCheckout(controller.cartItems[index]);
                },
              ),
              ),

              SizedBox(height: 44),
              BigTitle('Bill Summary'),
              Obx(() => Text('Total Amount : ${controller.totalAmount.toString()}'),),
            ],
          ),
        ),
      ),
    );
  }

  Widget topBar() {
    return Row(
      spacing: 12,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffF5F5F6),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(CupertinoIcons.back),
          ),
        ),
        BigTitle('Cart'),
      ],
    );
  }
}
