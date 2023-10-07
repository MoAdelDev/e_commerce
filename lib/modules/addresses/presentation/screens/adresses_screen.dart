import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/addresses/presentation/widgets/address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../controller/addresses_bloc.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            S.of(context).myAddressesTitle,
          ),
        ),
        body: BlocBuilder<AddressesBloc, AddressesState>(
          builder: (context, state) {
            if (state.addressesState != RequestState.success) {
              return Container(
                color: Theme.of(context).colorScheme.background,
                child: const Center(
                  child: DefaultProgressIndicator(
                    size: 70.0,
                  ),
                ),
              );
            } else if (state.addresses.isEmpty) {
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: DefaultAnimatedText(
                          text: S.of(context).noAddressTitle,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DefaultButton(
                          onPressed: () => Navigator.pushNamed(
                              context, RouteConst.addOrAddressScreen),
                          text: S.of(context).addNewAddress),
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        Address address = state.addresses[index];
                        return AddressWidget(address: address);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20.0,
                      ),
                      itemCount: state.addresses.length,
                      physics: DefaultScrollPhysics.defaultPhysics(),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DefaultButton(
                    onPressed: () {
                      ScreenArgs screenArgs =
                          ScreenArgs.toAddAndEditAddressScreen(
                        0,
                        '',
                        '',
                        '',
                        '',
                        '',
                      );
                      Navigator.pushNamed(
                        context,
                        RouteConst.addOrAddressScreen,
                        arguments: screenArgs,
                      );
                    },
                    text: S.of(context).addNewAddress,
                    icon: Icons.location_on,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
