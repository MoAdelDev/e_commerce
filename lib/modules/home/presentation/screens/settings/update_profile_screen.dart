import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/style/components/default_text_form_field.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_event.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/home/home_bloc.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _nameController = TextEditingController(text: MyApp.user?.name);

  final _emailController = TextEditingController(text: MyApp.user?.email);

  final _phoneController = TextEditingController(text: MyApp.user?.phone);

  final _passwordController = TextEditingController();

  bool isPasswordHidden = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).updateProfileTitle),
            ),
            body: SingleChildScrollView(
              physics: DefaultScrollPhysics.defaultPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).nameTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          DefaultTextFormField(
                            controller: _nameController,
                            hintText: S.of(context).nameHintTitle,
                            prefixIcon: Icons.person,
                            errorMsg: S.of(context).nameHintTitle,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).emailTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          DefaultTextFormField(
                            controller: _emailController,
                            hintText: S.of(context).emailHintTitle,
                            prefixIcon: Icons.email,
                            errorMsg: S.of(context).emailHintTitle,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).phoneTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          DefaultTextFormField(
                            controller: _phoneController,
                            hintText: S.of(context).phoneHintTitle,
                            prefixIcon: Icons.phone,
                            errorMsg: S.of(context).phoneHintTitle,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).passwordTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          DefaultTextFormField(
                            controller: _passwordController,
                            hintText: S.of(context).passwordHintTitle,
                            prefixIcon: Icons.lock,
                            errorMsg: S.of(context).passwordHintTitle,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            suffixIcon: isPasswordHidden
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            onSuffixIcon: () {
                              setState(() {
                                isPasswordHidden = !isPasswordHidden;
                              });
                            },
                            obscureText: isPasswordHidden,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      if (state.updateProfileState == RequestState.loading)
                        const Center(
                          child: DefaultProgressIndicator(
                            size: 40.0,
                          ),
                        ),
                      if (state.updateProfileState != RequestState.loading)
                        DefaultButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<HomeBloc>().add(
                                    HomeUpdateProfileEvent(
                                      _nameController.text,
                                      _emailController.text,
                                      _phoneController.text,
                                      _passwordController.text,
                                      context,
                                    ),
                                  );
                            }
                          },
                          text: S.of(context).updateProfileTitle,
                          icon: Icons.edit,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
