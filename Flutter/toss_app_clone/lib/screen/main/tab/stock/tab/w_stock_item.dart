import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/vo_stock.dart';
import 'package:flutter/material.dart';


class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem(this.stock, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          width10,
          Image.asset(stock.stockImagePath, width: 50),
          width20,
          (stock.name).text.size(18).bold.color(context.appColors.dimmedText).make(),
          emptyExpanded,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (stock.todayPercentageString)
                  .text
                  .size(20)
                  .bold
                  .color(stock.getTodayPercentageColor(context))
                  .make(),
              height5,
              (stock.yesterdayClosePrice.toComma())
                  .text
                  .size(14)
                  .color(context.appColors.dimmedText)
                  .make(),
            ],
          ),
          width10,
        ],
      ),
    );
  }
}
