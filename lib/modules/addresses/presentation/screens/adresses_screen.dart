import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
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
    return BlocBuilder<AddressesBloc, AddressesState>(
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
        }
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Text(
                S.of(context).myAddressesTitle,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10.0),
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
                        itemCount: state.addresses.length),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DefaultButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RouteConst.addAddressScreen,
                    ),
                    text: S.of(context).addNewAddress,
                    icon: Icons.location_on,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
