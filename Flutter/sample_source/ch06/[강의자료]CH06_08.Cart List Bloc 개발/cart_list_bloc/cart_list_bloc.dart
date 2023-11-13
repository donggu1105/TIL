import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/error/error_response.dart';
import '../../../../../core/utils/exception/common_exception.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../domain/model/display/display.model.dart';

import '../../../../../domain/usecase/display/cart/cart.usecase.dart';
import '../../../../../domain/usecase/display/cart/change_cart_qty.usecase.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';

part 'cart_list_state.dart';

part 'cart_list_event.dart';

part 'cart_list_bloc.freezed.dart';

@injectable
class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final DisplayUsecase _displayUsecase;

  CartListBloc(this._displayUsecase) : super(CartListState()) {
    on<CartListInitialized>(_onCartListInitialized);
    on<CartListAdded>(_onCartListAdded);
    on<CartListSelected>(_onCartSelected);
    on<CartListSelectedAll>(_onCartSelectedAll);
    on<CartListDeleted>(_onCartDeleted);
    on<CartListQtyDecreased>(_onCartQtyDecreased);
    on<CartListQtyIncreased>(_onCartQtyIncreased);
  }

  Future<void> _onCartListInitialized(
    CartListInitialized event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {} catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      ));
    }
  }

  Future<void> _onCartListAdded(
    CartListAdded event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {} catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      ));
    }
  }

  Future<void> _onCartDeleted(
    CartListDeleted event,
    Emitter<CartListState> emit,
  ) async {
    try {} catch (error) {
      CustomLogger.logger.e('${error.toString()}');
      emit(state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      ));
    }
  }

  void _onCartSelected(
    CartListSelected event,
    Emitter<CartListState> emit,
  ) {
    try {} catch (error) {
      CustomLogger.logger.e('${error.toString()}');
      emit(state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      ));
    }
  }

  void _onCartSelectedAll(
    CartListSelectedAll event,
    Emitter<CartListState> emit,
  ) {
    try {} catch (error) {
      CustomLogger.logger.e('${error.toString()}');
      emit(state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      ));
    }
  }

  Future<void> _onCartQtyIncreased(
    CartListQtyIncreased event,
    Emitter<CartListState> emit,
  ) async {
    try {} catch (error) {
      CustomLogger.logger.e('${error.toString()}');
      emit(state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      ));
    }
  }

  Future<void> _onCartQtyDecreased(
    CartListQtyDecreased event,
    Emitter<CartListState> emit,
  ) async {
    try {} catch (error) {
      CustomLogger.logger.e('${error.toString()}');
      emit(state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      ));
    }
  }

  int _calTotalPrice(List<String> selectedIds, List<Cart> carts) {
    int price = 0;

    return price;
  }
}
