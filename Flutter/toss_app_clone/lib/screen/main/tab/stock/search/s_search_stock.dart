import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_search_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_auto_complete_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}


class SearchStockScreen extends StatefulWidget  {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockFragmentState();
}

class _SearchStockFragmentState extends State<SearchStockScreen> with SearchStockDataProvider {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    Get.put(SearchStockData());
    controller.addListener(() {
      searchData.search(controller.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchStockData>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(
        controller: controller,
      ),
      body: Obx(() => searchData.autoCompleteList.isEmpty ?
          ListView(
            children: const [
              SearchHistoryStockList(),
              PopularSearchStockList(),
            ]
          ) :
              SearchAutoCompleteList(),
      ),
    );
  }
}
