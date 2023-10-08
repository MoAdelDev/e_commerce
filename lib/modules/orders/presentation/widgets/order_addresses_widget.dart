import 'package:e_commerce_app/core/style/components/default_shimmer.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/route/route_string.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/fonts.dart';
import '../../../../generated/l10n.dart';
import '../controller/order_confirmation/order_confirmation_bloc.dart';
import 'order_title_widget.dart';

class OrderAddressesWidget extends StatelessWidget {
  const OrderAddressesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderConfirmationBloc, OrderConfirmationState>(
      builder: (context, state) {
        if (state.addressesState == RequestState.loading) {
          return ListView.separated(
            itemBuilder: (context, index) =>
                const SizedBox(height: 50.0, child: DefaultShimmer()),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          );
        } else if (state.addresses.isEmpty) {}
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                OrderTitleWidget(text: S.of(context).myAddressesTitle),
                const Spacer(),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RouteConst.addressScreen),
                  child: Text(
                    S.of(context).changeTitle.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColorLight.primaryColor,
                        fontFamily: AppFonts.boldFont),
                  ),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).colorScheme.surface,
                elevation: 3.0,
                child: Column(
                  children: List.generate(state.addresses.length, (index) {
                    Address address = state.addresses[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Radio(
                            value: index,
                            groupValue: state.addressSelected,
                            onChanged: (value) {
                              context.read<OrderConfirmationBloc>().add(
                                  OrderConfirmationChangeAddressEvent(
                                      addressId: address.id,
                                      addressSelected: value ?? 0));
                            },
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  address.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                    fontFamily: AppFonts.boldFont,
                                  ),
                                ),
                                Text(
                                  address.details,
                                  style:
                                  Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                )
              ),
            ),
          ],
        );
      },
    );
  }
}
