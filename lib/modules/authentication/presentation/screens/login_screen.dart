import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/style/components/default_material_button.dart';
import '../../../../core/style/components/default_progress_indicator.dart';
import '../../../../core/style/components/default_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../controller/login/login_bloc.dart';
import '../controller/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scrollController = ScrollController();

  LoginScreen({Key? key}) : super(key: key);

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
              backgroundColor: Theme.of(context).colorScheme.primary,
              body: Column(
                children: [
                  SizedBox(
                    height: 80.0.h,
                  ),
                  SvgPicture.asset(
                    'assets/images/shop.svg',
                    height: 100,
                    width: 100.0,
                  ),
                  SizedBox(height: 10.0.h),
                  Text(
                    S.of(context).appName,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 20.0.h),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white30,
                                blurRadius: 25,
                                spreadRadius: 0.5,
                                offset: Offset(0.6, 0.6),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  DefaultAnimatedText(
                                      text: S.of(context).loginTitle,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  SizedBox(
                                    height: 20.0.h,
                                  ),
                                  DefaultTextFormField(
                                    controller: _emailController,
                                    hintText: S.of(context).emailHintTitle,
                                    prefixIcon: Icons.email,
                                    keyboardType: TextInputType.emailAddress,
                                    errorMsg: S.of(context).emailHintTitle,
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  DefaultTextFormField(
                                    controller: _passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    hintText: S.of(context).passwordHintTitle,
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
                                      // validate and login user
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginBloc>().add(
                                              LoginEvent(
                                                _emailController.text,
                                                _passwordController.text,
                                                S.of(context).loginSuccessMsg,
                                              ),
                                            );
                                      }
                                    },
                                    errorMsg: S.of(context).passwordHintTitle,
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  ConditionalBuilder(
                                    condition: state.loginState !=
                                        RequestState.loading,
                                    builder: (context) => Column(
                                      children: [
                                        DefaultButton(
                                            onPressed: () {
                                              // to dismiss keyboard
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                              // validate and user login
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<LoginBloc>()
                                                    .add(LoginEvent(
                                                      _emailController.text,
                                                      _passwordController.text,
                                                      S.of(context).loginSuccessMsg
                                                    ));
                                              }
                                            },
                                            text: S.of(context).signInTitle),
                                        SizedBox(
                                          height: 5.0.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              S.of(context).registerQuestion,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            TextButton(
                                              child: Text(
                                                  S.of(context).registerTitle),
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    RouteConst.registerScreen);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    fallback: (context) => Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                      ).r,
                                      child: const Center(
                                        child: DefaultSpinKit(),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
