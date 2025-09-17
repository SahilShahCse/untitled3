import 'package:flutter/material.dart';
import 'package:untitled3/models/cart_item_model.dart';
import 'package:untitled3/widgets/add_sub_item.dart';
import 'package:untitled3/widgets/texts/canceled_price.dart';
import 'package:untitled3/widgets/texts/price_text.dart';
import 'package:untitled3/widgets/texts/subtitle_text.dart';
import 'package:untitled3/widgets/texts/title_text.dart';

class ItemCardCheckout extends StatelessWidget {

  final CartItemModel item;
  const ItemCardCheckout(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE6E6E7)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image(image: NetworkImage(item.image)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(item.title),
              SubtitleText(item.description),
            ],
          ),
        ),
        AddSubItem(id: item.id,),
        Column(
          children: [
            CanceledPrice((item.price + 100).toString()),
            PriceText(item.price.toString()),
          ],
        )
      ],
    );
  }
}
