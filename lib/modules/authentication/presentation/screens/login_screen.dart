import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/style/app_string_en.dart';
import '../../../../core/style/components/default_material_button.dart';
import '../../../../core/style/components/default_progress_indicator.dart';
import '../../../../core/style/components/default_text_form_field.dart';
import '../controller/login/login_bloc.dart';
import '../controller/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state.loginState == RequestState.success) {
              Navigator.pushNamedAndRemoveUntil(
                  context, homeScreen, (route) => false);
            }
          });
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 1 / 3.h,
                    horizontal: 20.0,
                  ).r,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultAnimatedText(
                          text: AppStringEn.loginTitleText,
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 30.0.h,
                        ),
                        DefaultTextFormField(
                          controller: _emailController,
                          hintText: AppStringEn.emailHintText,
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          errorMsg: AppStringEn.emailErrorMsgText,
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        DefaultTextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: AppStringEn.passwordHintText,
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
                            FocusManager.instance.primaryFocus?.unfocus();
                            // validate and login user
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                    LoginEvent(_emailController.text,
                                        _passwordController.text),
                                  );
                            }
                          },
                          errorMsg: AppStringEn.passwordErrorMsgText,
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        ConditionalBuilder(
                          condition: state.loginState != RequestState.loading,
                          builder: (context) => Column(
                            children: [
                              DefaultButton(
                                  onPressed: () {
                                    // to dismiss keyboard
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    // validate and user login
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginBloc>().add(LoginEvent(
                                          _emailController.text,
                                          _passwordController.text));
                                    }
                                  },
                                  text: AppStringEn.loginButtonText),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppStringEn.registerText,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  TextButton(
                                    child: const Text(
                                        AppStringEn.registerButtonText),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, registerScreen);
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
          );
        },
      ),
    );
  }
}
