import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/components/default_animated_text.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/style/components/default_shimmer.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/route/route_string.dart';
import '../../../../../core/route/screen_args.dart';
import '../../../../../generated/l10n.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: BlocProvider<CartBloc>(
        create: (context) => CartBloc(sl(), sl(), sl())
          ..add(
            CartGetProductsCartEvent(),
          ),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.productsCartState != RequestState.success) {
              return const Center(
                  child: DefaultProgressIndicator(
                size: 60.0,
              ));
            }
            if (state.cart.products.isEmpty) {
              return Center(
                child: DefaultAnimatedText(
                    text: S.of(context).noProductsTitle,
                    textStyle: Theme.of(context).textTheme.titleLarge),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: DefaultScrollPhysics.defaultPhysics(),
                    itemCount: state.cart.products.length,
                    itemBuilder: (context, index) {
                      ProductCart cart = state.cart.products[index];
                      return InkWell(
                        onTap: () {
                          ScreenArgs args =
                              ScreenArgs.toProductDetails(cart.productId);
                          Navigator.pushNamed(
                              context, RouteConst.productDetailsScreen,
                              arguments: args);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100.0,
                                    width: 100.0,
                                    child: CachedNetworkImage(
                                      imageUrl: cart.image,
                                      errorWidget: (context, url, error) =>
                                          const DefaultShimmer(),
                                      placeholder: (context, url) =>
                                          const DefaultShimmer(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cart.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  'EGP ${cart.price.toString()}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              if (cart.discount != 0)
                                                Text(
                                                  'EGP ${cart.oldPrice.toString()}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.1,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: MyApp.language ==
                                              Language.arabic.name
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            )
                                          : const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                            ),
                                    ),
                                    child: MaterialButton(
                                      onPressed: MyApp.productCartQuantity[
                                                      cart.productId] ==
                                                  1 ||
                                              isLoading(state)
                                          ? null
                                          : () {
                                              context.read<CartBloc>().add(
                                                    CartUpdateProductsCartEvent(
                                                        cart.id,
                                                        cart.quantity - 1,
                                                        cart.productId),
                                                  );
                                            },
                                      child: Text(
                                        '-',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.1,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColorLight.primaryColor)),
                                    child: Center(
                                      child: isLoading(state)
                                          ? const DefaultProgressIndicator(
                                              size: 25,
                                            )
                                          : Text(
                                              '${MyApp.productCartQuantity[cart.productId]}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.1,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: MyApp.language ==
                                              Language.arabic.name
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                            )
                                          : const BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            ),
                                    ),
                                    child: MaterialButton(
                                      onPressed: isLoading(state)
                                          ? null
                                          : () {
                                              context.read<CartBloc>().add(
                                                    CartUpdateProductsCartEvent(
                                                        cart.id,
                                                        cart.quantity + 1,
                                                        cart.productId),
                                                  );
                                            },
                                      child: Text(
                                        '+',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  MaterialButton(
                                    onPressed: () {
                                      // remove product from cart
                                      context.read<CartBloc>().add(
                                            CartDeleteProductFromCartEvent(
                                                cart.id, cart.productId),
                                          );
                                    },
                                    color: Theme.of(context).colorScheme.background,
                                    elevation: 0,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          S.of(context).removeTitle,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Divider(
                            color: Colors.grey[400],
                            height: 1,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DefaultButton(
                    onPressed: () {},
                    text:
                        '${S.of(context).checkoutTitle} (EGP ${state.cart.totalPrice})',
                    textStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  bool isLoading(CartState state) {
    if (state.updateState == RequestState.loading ||
        state.deleteState == RequestState.loading) {
      return true;
    }
    return false;
  }
}
