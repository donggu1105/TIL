import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
import 'package:flutter/material.dart';

import 'dummy_popular_stocks.dart';

class PopularSearchStockList extends StatelessWidget {
  const PopularSearchStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            "인기 검색".text.bold.make(),
            emptyExpanded,
            "오늘 ${DateTime.now().formattedTime} 기준".text.make(),
          ],
        ).pSymmetric(h: 16, v: 16),
        height20,
        ...popularStocks.mapIndexed((e, i) => PopularStockItem(stock: e, number: i + 1)).toList(),
      ],
    );
  }
}
