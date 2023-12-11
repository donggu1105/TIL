import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/vo_popular_stock.dart';
import 'package:flutter/material.dart';

class PopularStockItem extends StatelessWidget {
  final PopularStock stock;
  final int number;

  const PopularStockItem({required this.stock, required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        number.text.bold.white.size(16).make(),
        width20,
        stock.name.text.bold.white.size(16).make(),
        emptyExpanded,
        stock.todayPercentageString.text
            .color(stock.getTodayPercentageColor(context))
            .size(16)
            .make(),
      ],
    ).pSymmetric(h: 20, v: 20);
  }
}
