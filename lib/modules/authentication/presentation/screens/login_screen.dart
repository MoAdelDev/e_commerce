import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/data/local/data.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/style/components/default_animation.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/style/components/default_material_button.dart';
import '../../../../core/style/components/default_progress_indicator.dart';
import '../../../../core/style/components/default_scroll_physics.dart';
import '../../../../core/style/components/default_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../controller/login/login_bloc.dart';
import '../controller/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(sl()),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state.loginState == RequestState.success) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteConst.homeScreen, (route) => false);
            }
          });

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              resizeToAvoidBottomInset: false,
              backgroundColor: Theme.of(context).colorScheme.background,
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgPicture.asset(
                          'assets/images/shop.svg',
                          height: 100.0,
                          width: 100.0,
                        )),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: DefaultAnimation(
                          animationDirection: AnimationDirection.up,
                          milliseconds: 2000,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppData.isDark
                                  ? AppColorLight.primaryColor.shade700
                                  : AppColorLight.primaryColor.shade100,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withAlpha(50),
                                  blurRadius: 25,
                                  spreadRadius: 0.5,
                                  offset: const Offset(0.6, 0.6),
                                ),
                              ],
                            ),
                            child: SingleChildScrollView(
                              physics: DefaultScrollPhysics.defaultPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      DefaultAnimatedText(
                                        text: S.of(context).loginTitle,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      DefaultTextFormField(
                                        controller: _emailController,
                                        hintText: S.of(context).emailHintTitle,
                                        prefixIcon: Icons.email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        errorMsg: S.of(context).emailHintTitle,
                                        textInputAction: TextInputAction.next,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      DefaultTextFormField(
                                        controller: _passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        hintText:
                                            S.of(context).passwordHintTitle,
                                        prefixIcon: Icons.lock,
                                        obscureText: state.isPasswordHidden,
                                        suffixIcon: state.isPasswordHidden
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded,
                                        onSuffixIcon: () {
                                          context
                                              .read<LoginBloc>()
                                              .add(LoginShowPasswordEvent());
                                        },
                                        onSubmit: (value) {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        errorMsg:
                                            S.of(context).passwordHintTitle,
                                        textInputAction: TextInputAction.done,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      ConditionalBuilder(
                                        condition: state.loginState !=
                                            RequestState.loading,
                                        builder: (context) => Column(
                                          children: [
                                            DefaultButton(
                                                onPressed: () {
                                                  // to dismiss keyboard
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                  // validate and user login
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    context
                                                        .read<LoginBloc>()
                                                        .add(
                                                          LoginEvent(
                                                            _emailController
                                                                .text,
                                                            _passwordController
                                                                .text,
                                                            S
                                                                .of(context)
                                                                .loginSuccessMsg,
                                                          ),
                                                        );
                                                  }
                                                },
                                                text:
                                                    S.of(context).signInTitle),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  S
                                                      .of(context)
                                                      .registerQuestion,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: AppData.isDark
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary
                                                        : Colors.grey[700],
                                                  ),
                                                ),
                                                TextButton(
                                                  child: Text(
                                                    S.of(context).registerTitle,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontFamily:
                                                              AppFonts.boldFont,
                                                          color: AppData.isDark
                                                              ? Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .error
                                                              : AppColorLight
                                                                  .primaryColor,
                                                        ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        RouteConst
                                                            .registerScreen);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        fallback: (context) => const Padding(
                                          padding: EdgeInsets.only(
                                            top: 8.0,
                                          ),
                                          child: Center(
                                            child: DefaultProgressIndicator(
                                              size: 35.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
