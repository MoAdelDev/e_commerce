import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/style/components/default_shimmer.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order_details.dart';
import 'package:e_commerce_app/modules/orders/presentation/controller/order_details/order_details_bloc.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_card_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_divider_widget.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsScreen extends StatelessWidget {
  final ScreenArgs args;

  const OrderDetailsScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsBloc(
        sl(),
        sl(),
      )..add(OrderDetailsGetEvent(args.order.id)),
      child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
        builder: (context, state) {
          if (state.orderDetailsState == RequestState.success) {
            Address? address = state.orderDetails?.address;
            List<OrderProduct>? products = state.orderDetails?.products;
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: AppBar(
                title: Text(S.of(context).orderDetailsTitle),
                actions: [
                  if (state.orderDetails?.status == 'New' ||
                      state.orderDetails?.status == 'جديد')
                    state.cancelOrderState == RequestState.loading
                        ? const DefaultProgressIndicator(
                            size: 40.0,
                          )
                        : TextButton(
                            onPressed: () => context
                                .read<OrderDetailsBloc>()
                                .add(OrderDetailsCancelOrderEvent(
                                    args.order.id)),
                            child: Text(
                              S.of(context).cancelOrder.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontFamily: AppFonts.semiBoldFont),
                            ),
                          ),
                ],
              ),
              body: SingleChildScrollView(
                physics: DefaultScrollPhysics.defaultPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: OrderCardWidget(
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${S.of(context).orderTitle} #${args.order.id}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontFamily: AppFonts.semiBoldFont),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '${S.of(context).placedOnTitle}: ${args.order.date}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey[700]),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '${S.of(context).nOfItemsTitle}: 5',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey[700]),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${S.of(context).totalTitle}: EGP ${args.order.totalPrice}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.grey[700]),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[600],
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Text(
                                    state.orderDetails?.status.toUpperCase() ??
                                        '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: OrderTitleWidget(
                                  text: S.of(context).paymentTitle),
                            ),
                            OrderCardWidget(
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).paymentMethodTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontFamily: AppFonts.semiBoldFont),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    S.of(context).cashOnDeliveryTitle,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const OrderDividerWidget(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '${S.of(context).itemTotalTitle}: EGP ${args.order.totalPrice}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    '${S.of(context).deliveryFeesTitle}: ${S.of(context).freeTitle}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '${S.of(context).totalTitle}: EGP ${args.order.totalPrice}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: OrderTitleWidget(
                                  text: S.of(context).addressTitle),
                            ),
                            OrderCardWidget(
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).shippingAddressTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontFamily: AppFonts.semiBoldFont),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    address?.name ?? '',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    address?.details ?? '',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${address?.city ?? ''}, ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      Text(
                                        address?.region ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: OrderTitleWidget(
                                text: S.of(context).itemsTitle,
                              ),
                            ),
                            OrderCardWidget(
                              widget: ListView.separated(
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    ScreenArgs args =
                                        ScreenArgs.toProductDetails(
                                            products?[index].id ?? 0);
                                    Navigator.pushNamed(context,
                                        RouteConst.productDetailsScreen,
                                        arguments: args);
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: products?[index].image ?? '',
                                        errorWidget: (context, url, error) =>
                                            const DefaultShimmer(),
                                        placeholder: (context, error) =>
                                            const DefaultShimmer(),
                                        width: 80.0,
                                        height: 80.0,
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products?[index].name ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontFamily: AppFonts
                                                          .semiBoldFont),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              'EGP ${products?[index].price}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              '${S.of(context).quantityTitle} -> ${products?[index].quantity}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const OrderDividerWidget(),
                                itemCount: products?.length ?? 0,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).orderDetailsTitle),
            ),
            body: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 30,
              itemBuilder: (context, index) => const SizedBox(
                height: 50.0,
                width: double.infinity,
                child: DefaultShimmer(),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}
