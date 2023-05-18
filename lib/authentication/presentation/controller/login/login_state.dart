import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/user.dart';

class LoginState extends Equatable {
  final User? user;
  final RequestState loginState;
  final String loginError;
  final bool isPasswordHidden;

  const LoginState({
    this.user,
    this.loginState = RequestState.nothing,
    this.loginError = ' ',
    this.isPasswordHidden = true,
  });

  LoginState copyWith({
    User? user,
    RequestState? loginState,
    String? loginError,
    bool? isPasswordHidden,
    IconData? passwordVisibleIcon,
  }) =>
      LoginState(
        user: user ?? this.user,
        loginState: loginState ?? this.loginState,
        loginError: loginError ?? this.loginError,
        isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      );

  @override
  List<Object?> get props => [
        user,
        loginState,
        loginError,
        isPasswordHidden,
      ];
}
