import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/data/local/data.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/route/route_string.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/components/default_animated_text.dart';
import '../../../../core/style/components/default_animation.dart';
import '../../../../core/style/components/default_material_button.dart';
import '../../../../core/style/components/default_progress_indicator.dart';
import '../../../../core/style/components/default_text_form_field.dart';
import '../../../../core/utils/enums.dart';
import '../../../../generated/l10n.dart';
import '../controller/register/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(sl()),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state.registerState == RequestState.success) {
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
                                        text: S.of(context).registerTitle,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      DefaultTextFormField(
                                        controller: _nameController,
                                        hintText: S.of(context).nameHintTitle,
                                        prefixIcon: Icons.person,
                                        keyboardType: TextInputType.name,
                                        errorMsg: S.of(context).nameHintTitle,
                                        textInputAction: TextInputAction.next,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
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
                                        controller: _phoneController,
                                        hintText: S.of(context).phoneHintTitle,
                                        prefixIcon: Icons.phone,
                                        keyboardType: TextInputType.phone,
                                        errorMsg: S.of(context).phoneHintTitle,
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
                                          context.read<RegisterBloc>().add(
                                              const RegisterShowPasswordEvent());
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
                                        condition: state.registerState !=
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
                                                      .read<RegisterBloc>()
                                                      .add(
                                                        RegisterEvent(
                                                          _nameController.text,
                                                          _emailController.text,
                                                          _phoneController.text,
                                                          _passwordController
                                                              .text,
                                                          S
                                                              .of(context)
                                                              .registerSuccessMsg,
                                                        ),
                                                      );
                                                }
                                              },
                                              text: S.of(context).signUpTitle,
                                            ),
                                          ],
                                        ),
                                        fallback: (context) => const Padding(
                                          padding: EdgeInsets.only(
                                            top: 8.0,
                                          ),
                                          child: Center(
                                            child: DefaultProgressIndicator(
                                              size: 35,
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

/* Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            appBar: AppBar(
              elevation: 0.0,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 80.0.h - AppBar().preferredSize.height,
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                DefaultAnimatedText(text: S.of(context).registerTitle, textStyle: Theme.of(context).textTheme.titleLarge),
                                SizedBox(height: 20.0.h,),
                                DefaultTextFormField(
                                  controller: _nameController,
                                  hintText: S.of(context).nameHintTitle,
                                  prefixIcon: Icons.person,
                                  keyboardType: TextInputType.name,
                                  errorMsg: S.of(context).nameHintTitle,
                                  textInputAction: TextInputAction.next,

                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                DefaultTextFormField(
                                  controller: _emailController,
                                  hintText: S.of(context).emailHintTitle,
                                  prefixIcon: Icons.email,
                                  keyboardType: TextInputType.emailAddress,
                                  errorMsg: S.of(context).emailHintTitle,
                                  textInputAction: TextInputAction.next,

                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                DefaultTextFormField(
                                  controller: _phoneController,
                                  hintText: S.of(context).phoneHintTitle,
                                  prefixIcon: Icons.phone,
                                  keyboardType: TextInputType.phone,
                                  errorMsg: S.of(context).phoneHintTitle,
                                  textInputAction: TextInputAction.next,

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
                                        .read<RegisterBloc>()
                                        .add(const RegisterShowPasswordEvent());
                                  },
                                  onSubmit: (value) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  errorMsg: S.of(context).passwordHintTitle,
                                  textInputAction: TextInputAction.done,
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).viewInsets.bottom),
                                  child: ConditionalBuilder(
                                    condition:
                                        state.registerState != RequestState.loading,
                                    builder: (context) => DefaultButton(
                                        onPressed: () {
                                          // to dismiss keyboard
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          // validate and login user
                                          if (_formKey.currentState!.validate()) {
                                            context.read<RegisterBloc>().add(
                                                  RegisterEvent(
                                                    _nameController.text,
                                                    _emailController.text,
                                                    _phoneController.text,
                                                    _passwordController.text,
                                                    S.of(context).registerSuccessMsg,
                                                  ),
                                                );
                                          }
                                        },
                                        text: S.of(context).signUpTitle),
                                    fallback: (context) => Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                      ).r,
                                      child: const Center(
                                        child: DefaultSpinKit(),
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
              ],
            ),
          );*/
