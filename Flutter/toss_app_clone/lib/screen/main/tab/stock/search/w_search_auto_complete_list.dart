import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchStockDataProvider {
  SearchAutoCompleteList({super.key});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      debugPrint("---------");
      debugPrint(searchData.autoCompleteList[index].name);
      debugPrint("---------");
      searchData.autoCompleteList[index].name.text.color(Colors.red).make();

    },
      itemCount: searchData.autoCompleteList.length,

    );
  }
}
