import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class AddSubItem extends StatelessWidget {
  final int id;

  const AddSubItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Obx(() {
      // Fetch count reactively from cartItems
      final count = controller.cartItems.firstWhereOrNull((item) => item.id == id)?.count ?? 0;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xffE6E6E7)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => controller.removeItem(id),
              child: const Icon(
                CupertinoIcons.minus,
                size: 16,
                color: Color(0xff2C7572),
              ),
            ),
            const SizedBox(width: 12),
            Text(count.toString(), style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => controller.addItem(id),
              child: const Icon(
                CupertinoIcons.add,
                size: 16,
                color: Color(0xff2C7572),
              ),
            ),
          ],
        ),
      );
    });
  }
}