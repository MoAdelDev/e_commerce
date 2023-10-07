import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/style/components/default_text_form_field.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/addresses/presentation/controller/addresses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/route/screen_args.dart';

class AddOrEditAddressScreen extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ScreenArgs screenArgs;

  AddOrEditAddressScreen({
    super.key,
    required this.screenArgs,
  }) {
    _fullNameController.text = screenArgs.addressName;
    _addressController.text = screenArgs.addressDetails;
    _noteController.text = screenArgs.addressNotes;
    _cityController.text = screenArgs.addressCity;
    _regionController.text = screenArgs.addressRegion;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesBloc, AddressesState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                screenArgs.addressId == 0
                    ? S.of(context).addNewAddress
                    : S.of(context).editNewAddress,
              ),
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
                            S.of(context).fullNameTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DefaultTextFormField(
                            controller: _fullNameController,
                            hintText: S.of(context).fullNameHintTitle,
                            prefixIcon: Icons.person,
                            errorMsg: S.of(context).fullNameHintTitle,
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
                            S.of(context).addressTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DefaultTextFormField(
                            controller: _addressController,
                            hintText: S.of(context).addressHintTitle,
                            prefixIcon: Icons.location_on,
                            errorMsg: S.of(context).addressHintTitle,
                            keyboardType: TextInputType.text,
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
                            S.of(context).noteTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DefaultTextFormField(
                            controller: _noteController,
                            hintText: S.of(context).noteHintTitle,
                            prefixIcon: Icons.note,
                            errorMsg: S.of(context).noteHintTitle,
                            keyboardType: TextInputType.text,
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
                            S.of(context).cityTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DefaultTextFormField(
                            controller: _cityController,
                            hintText: S.of(context).cityHintTitle,
                            prefixIcon: Icons.location_city,
                            errorMsg: S.of(context).cityHintTitle,
                            keyboardType: TextInputType.text,
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
                            S.of(context).regionTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DefaultTextFormField(
                            controller: _regionController,
                            hintText: S.of(context).regionHintTitle,
                            prefixIcon: Icons.location_city,
                            errorMsg: S.of(context).regionHintTitle,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      state.addOrUpdateAddressState == RequestState.loading
                          ? const Center(
                              child: DefaultProgressIndicator(),
                            )
                          : DefaultButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (_formKey.currentState!.validate()) {
                                  if (screenArgs.addressId == 0) {
                                    context.read<AddressesBloc>().add(
                                          AddressesAddEvent(
                                            _fullNameController.text,
                                            _addressController.text,
                                            _noteController.text,
                                            _cityController.text,
                                            _regionController.text,
                                            context,
                                          ),
                                        );
                                  }
                                  else{
                                    context.read<AddressesBloc>().add(
                                      AddressesUpdateEvent(
                                        screenArgs.addressId,
                                        _fullNameController.text,
                                        _addressController.text,
                                        _noteController.text,
                                        _cityController.text,
                                        _regionController.text,
                                        context,
                                      ),
                                    );
                                  }
                                }
                              },
                              text: 'Save',
                              icon: Icons.check,
                            )
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
