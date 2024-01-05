import 'dart:convert';

import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../common/util/local_json.dart';
import '../tab/vo_simple_stock.dart';

class SearchStockData extends GetxController  {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(["삼성전자1","삼성전자2","삼성전자3","삼성전자4" ]);
    loadLocalStockJson();
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList = await LocalJson.getObjectList<SimpleStock>('json/stock_list.json');
    stocks.addAll(jsonList);
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      autoCompleteList.clear();
      return;
    }

    autoCompleteList.value = stocks.where((element) => element.name.contains(keyword)).toList();
    debugPrint("=========");
    debugPrint('keyword : $keyword');
    debugPrint('autoCompleteList : ${autoCompleteList.value}');
    debugPrint("=========");

  }
}