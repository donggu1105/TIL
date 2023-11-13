import 'package:flutter/material.dart';

import 'component/add_cart_btn.dart';
import 'component/cart_price_info.dart';
import 'component/cart_product_info.dart';

Future<bool?> cartBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              CartProductInfo(),
              CartPriceInfo(),
              AddCartBtn(),
            ],
          ),
        ));
      });
}
