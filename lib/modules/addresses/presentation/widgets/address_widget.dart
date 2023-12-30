import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/addresses/presentation/controller/addresses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/local/data.dart';
import '../../../../main.dart';

class AddressWidget extends StatelessWidget {
  final Address address;

  const AddressWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: AppData.isDark ? Colors.grey[800] : Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            address.details,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            address.city,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            address.region,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 7.0,
          ),
          Row(
            children: [
              Text(
                AppData.user?.phone ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                      titlePadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      elevation: 3,
                      title: Row(
                        children: [
                          Text(
                            S.of(context).deleteAddressQuestionTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.close))
                        ],
                      ),
                      content: Text(
                        S.of(context).deleteAddressBodyTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      contentPadding: const EdgeInsets.all(10.0),
                      actions: [
                        BlocBuilder<AddressesBloc, AddressesState>(
                          builder: (context, state) {
                            if (state.deleteAddressState ==
                                RequestState.loading) {
                              return const Center(
                                child: DefaultProgressIndicator(
                                  size: 40.0,
                                ),
                              );
                            }
                            return DefaultButton(
                              onPressed: () {
                                context.read<AddressesBloc>().add(
                                    AddressesDeleteEvent(address.id, context));
                              },
                              text: 'Delete',
                              icon: Icons.delete,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              InkWell(
                onTap: () {
                  ScreenArgs screenArgs = ScreenArgs.toAddAndEditAddressScreen(
                    address.id,
                    address.name,
                    address.details,
                    address.note,
                    address.city,
                    address.region,
                  );
                  Navigator.pushNamed(
                    context,
                    RouteConst.addOrUpdateAddressScreen,
                    arguments: screenArgs,
                  );
                },
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
