import 'dart:async';
import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/style/app_string_en.dart';
import '../../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginBaseEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(const LoginState()) {
    on<LoginEvent>(_onLoginUser);
    on<LoginShowPasswordEvent>(_onShowPassword);
  }

  FutureOr<void> _onLoginUser(
      LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginState: RequestState.loading));
    Login login = Login(event.email, event.password);
    final result = await loginUseCase(login);
    result.fold((error) {
      showToast(
        msg: AppStringEn.loginErrorMsg,
        requestState: RequestState.error,
      );
      emit(
        state.copyWith(
            loginState: RequestState.error, loginError: error.message),
      );
    }, (userData) {
      MyApp.user = userData;
      CacheHelper.saveData(key: 'token', value: MyApp.user.token);
      showToast(
        msg: AppStringEn.loginSuccessMsg,
        requestState: RequestState.success,
      );
      emit(state.copyWith(user: userData, loginState: RequestState.success));
    });
  }

  FutureOr<void> _onShowPassword(
      LoginShowPasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      isPasswordHidden: !state.isPasswordHidden,
    ));
  }
}
