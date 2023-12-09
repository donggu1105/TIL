import 'package:fast_app_base/screen/main/tab/stock/tab/stock_percentage_data_provider.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/vo_popular_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/vo_simple_stock.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Stock extends PopularStock {
  final String stockImagePath;

  Stock(
      {required super.name,
      required this.stockImagePath,
      required super.yesterdayClosePrice,
      required super.currentPrice});
}
