import 'dart:async';
import 'dart:convert';

import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/display/cart/cart.model.dart';

part 'payment_state.dart';
part 'payment_event.dart';

part 'payment_bloc.freezed.dart';

enum PaymentStatus {
  initial,
  success,
  error,
}

@Injectable()
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState()) {
    on<PayMoney>(_onPayMoney);
  }

  Future<void> _onPayMoney(
    PayMoney event,
    Emitter<PaymentState> emit,
  ) async {}
}

Future<(bool, String?)> _bootPay(BuildContext context, Payload payload) async {
  final Completer<(bool, String?)> completer = Completer();

  (bool, String?) response = (false, '');

  Bootpay().requestPayment(
    context: context,
    payload: payload,
    showCloseButton: false,
    onCancel: (String data) {
      response = (false, data);
    },
    onError: (String data) {
      Bootpay().dismiss(context);
      response = (false, data);
    },
    onClose: () {
      Bootpay().dismiss(context);
      completer.complete(response);
    },
    onConfirm: (String data) {
      return true;
    },
    onDone: (String data) {
      response = (true, data);
    },
  );

  return completer.future;
}

Payload _getPayLoad(List<Cart> cartList) {
  Payload payload = Payload();
  double totalPrice = 0.0;

  List<Item> itemList = cartList.map((cart) {
    Item item = Item();
    item.name = cart.product.title;
    item.qty = cart.quantity;
    item.id = cart.product.productId;
    item.price = cart.product.price.toDouble();

    totalPrice += (cart.product.price * cart.quantity).toDouble();

    return item;
  }).toList();

  payload.androidApplicationId = "";
  payload.iosApplicationId = "";

  payload.pg = 'kcp';
  payload.orderName = cartList.length > 1
      ? '${cartList.first.product.title} 외 ${cartList.length - 1}건'
      : cartList.first.product.title;

  payload.price = totalPrice;
  payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();
  payload.items = itemList;

  Extra extra = Extra();
  extra.appScheme = '';

  payload.extra = extra;

  return payload;
}
