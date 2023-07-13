import 'dart:async';

import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/theme/app_string/app_string_en.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../main.dart';
import '../../../domain/entities/register.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/register_usecase.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterBaseEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(const RegisterState()) {
    on<RegisterEvent>(_onRegisterUser);

    on<RegisterShowPasswordEvent>(_onShowPassword);
  }

  FutureOr<void> _onRegisterUser(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
      registerState: RequestState.loading,
    ));
    Register register = Register(
      event.name,
      event.phone,
      '',
      event.email,
      event.password,
    );
    final result = await registerUseCase(register);
    result.fold((error) {
      showToast(
        msg: error.message,
        requestState: RequestState.error,
      );
      emit(state.copyWith(
        registerError: error.message,
        registerState: RequestState.error,
      ));
    }, (userData) {
      MyApp.user = userData;
      CacheHelper.saveData(
        key: 'token',
        value: userData.token,
      );
      showToast(
        msg: AppStringEn.registerSuccessMsg,
        requestState: RequestState.success,
      );
      emit(state.copyWith(
        user: userData,
        registerState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _onShowPassword(
      RegisterShowPasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));
  }
}
