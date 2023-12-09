import 'package:fast_app_base/screen/main/tab/stock/tab/stock_percentage_data_provider.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/vo_simple_stock.dart';
import 'package:simple_shadow/simple_shadow.dart';

class PopularStock extends SimpleStock with StockPercentageDataProvider {
  @override
  final int yesterdayClosePrice;
  @override
  final int currentPrice;

  PopularStock(
      {required this.yesterdayClosePrice,
      required this.currentPrice,
      required String name})
      : super(name);
}
