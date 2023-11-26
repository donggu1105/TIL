import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant.dart';
import 'bloc/cart_list_bloc/cart_list_bloc.dart';
import 'component/cart_product_card.dart';
import 'component/cart_total_price.dart';

//TODO cart_list_bloc 등록
class CartListPage extends StatelessWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //TODO app_bar 구현
      body: BlocBuilder<CartListBloc, CartListState>(
        builder: (_, state) {
          switch (state.status) {
            case Status.initial:
            case Status.loading:
            case Status.error:
              return const Center(child: CircularProgressIndicator());
            case Status.success:
              return ListView(
                children: [
                  Divider(
                    height: 8,
                    thickness: 8,
                    color: colorScheme.surface,
                  ),
                  //TODO 상품카드 구현
                  Column(children: [CartProductCard()]),
                  CartTotalPrice(isEmpty: false),
                ],
              );
          }
        },
      ),
    );
  }
}
