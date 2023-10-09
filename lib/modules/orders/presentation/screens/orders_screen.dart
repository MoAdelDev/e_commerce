import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/style/components/default_shimmer.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/orders/domain/entities/order.dart';
import 'package:e_commerce_app/modules/orders/presentation/controller/orders/orders_bloc.dart';
import 'package:e_commerce_app/modules/orders/presentation/widgets/order_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc(
        sl(),
        sl(),
      )..add(const OrdersGetEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            S.of(context).ordersTitle,
          ),
        ),
        body: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state.ordersState == RequestState.loading) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: DefaultShimmer(),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
                itemCount: 20,
              );
            }
            return ListView.separated(
              itemBuilder: (context, itemIndex) {
                Order order = state.orders[itemIndex];
                return InkWell(
                  onTap: () {
                    ScreenArgs args = ScreenArgs.toOrderDetails(order);
                    Navigator.pushNamed(context, RouteConst.orderDetailScreen,
                        arguments: args);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/shop.png',
                          width: 70,
                          height: 70,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "EGP ${order.totalPrice.toStringAsFixed(2)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontFamily: AppFonts.semiBoldFont),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                order.date,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                order.status,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.green[900],
                                      fontFamily: AppFonts.boldFont,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        if (order.status == 'New' || order.status == 'جديد')
                          state.cancelOrderState == RequestState.loading
                              ? const Center(
                                  child: DefaultProgressIndicator(
                                    size: 40.0,
                                  ),
                                )
                              : InkWell(
                                  onTap: () => context
                                      .read<OrdersBloc>()
                                      .add(OrdersCancelOrderEvent(order.id)),
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2),
                                  child: Text(
                                    S.of(context).cancelOrder,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontFamily: AppFonts.semiBoldFont),
                                  ),
                                ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const OrderDividerWidget(),
              itemCount: state.orders.length,
              physics: DefaultScrollPhysics.defaultPhysics(),
            );
          },
        ),
      ),
    );
  }
}
