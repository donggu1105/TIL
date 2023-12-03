import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_image_button.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  late final TabController tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          actions: [
            ImageButton(
              onTap: () {
                context.showSnackbar("검색");
              },
              imagePath: "$basePath/icon/stock_search.png",
            ),
            ImageButton(
              onTap: () {
                context.showSnackbar("캘린더");
              },
              imagePath: "$basePath/icon/stock_settings.png",
            ),
            ImageButton(
              onTap: () {
                context.showSnackbar("설정");
              },
              imagePath: "$basePath/icon/stock_calendar.png",
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              tabBar,
              myAccount,
              height20,
              myStocks
            ],
          )
        ),
      ],
    );
  }

  Widget get title => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      '토스증권'.text.bold.size(20).make(),
      width20,
      'S&P 500'.text.bold.size(13).color(context.appColors.lessImportantText).make(),
      width10,
      3919.20.toComma().text.bold.size(13).color(context.appColors.plus).make(),
    ]
  ).pOnly(left: 20);
  Widget get tabBar => Column(
    children: [
      TabBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        labelPadding: const EdgeInsets.symmetric(vertical: 20),
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
        indicatorColor: Colors.red,
        controller: tabController,
        tabs: [
        "내 주식".text.make(),
        "오늘의 발견".text.make(),
      ],),
      const Line()
    ],
  );
  Widget get myAccount => Placeholder();
  Widget get myStocks => Placeholder();

}


