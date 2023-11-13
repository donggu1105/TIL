import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/error/error_response.dart';
import '../../../../core/utils/exception/common_exception.dart';
import '../../../../core/utils/logger.dart';
import '../../../../domain/usecase/user/login.usecase.dart';
import '../../../../domain/usecase/user/login_with_token.usecase.dart';
import '../../../../domain/usecase/user/logout.usecase.dart';
import '../../../../domain/usecase/user/user.usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUsecase _userUsecase;

  UserBloc(this._userUsecase) : super(UserState()) {
    on<UserLogin>(_onUserLogin);
    on<UserLoginWithToken>(_onUserLoginWithToken);
    on<UserLogout>(_onUserLogout);
  }

  Future<void> _onUserLogin(
    UserLogin event,
    Emitter<UserState> emit,
  ) async {}

  Future<void> _onUserLoginWithToken(
    UserLoginWithToken event,
    Emitter<UserState> emit,
  ) async {}

  Future<void> _onUserLogout(
    UserLogout event,
    Emitter<UserState> emit,
  ) async {}
}
