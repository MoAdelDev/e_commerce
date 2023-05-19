import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/app_string/app_string_en.dart';
import '../../../../core/theme/components/default_material_button.dart';
import '../../../../core/theme/components/default_progress_indicator.dart';
import '../../../../core/theme/components/default_text_form_field.dart';
import '../controller/register/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => sl<RegisterBloc>(),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 1 / 7.h,
                  horizontal: 20.0,
                ).r,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStringEn.registerTitleText,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      DefaultTextFormField(
                        controller: _nameController,
                        hintText: AppStringEn.nameHintText,
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.name,
                        errorMsg: AppStringEn.nameErrorMsgText,
                      ),
                      SizedBox(
                        height: 10.0.h,
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
                        controller: _phoneController,
                        hintText: AppStringEn.phoneHintText,
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        errorMsg: AppStringEn.phoneErrorMsgText,
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
                              .read<RegisterBloc>()
                              .add(const RegisterShowPasswordEvent());
                        },
                        onSubmit: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          // validate and login user
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterBloc>().add(
                                  RegisterEvent(
                                    _nameController.text,
                                    _emailController.text,
                                    _phoneController.text,
                                    _passwordController.text,
                                  ),
                                );
                          }
                        },
                        errorMsg: AppStringEn.passwordErrorMsgText,
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      ConditionalBuilder(
                        condition: state.registerState != RequestState.loading,
                        builder: (context) => DefaultButton(
                            onPressed: () {
                              // to dismiss keyboard
                              FocusManager.instance.primaryFocus?.unfocus();
                              // validate and login user
                              if (_formKey.currentState!.validate()) {
                                context.read<RegisterBloc>().add(
                                      RegisterEvent(
                                        _nameController.text,
                                        _emailController.text,
                                        _phoneController.text,
                                        _passwordController.text,
                                      ),
                                    );
                              }
                            },
                            text: AppStringEn.registerButtonText),
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
          );
        },
      ),
    );
  }
}
