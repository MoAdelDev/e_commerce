import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/style/components/default_animated_text.dart';
import '../../../../core/style/components/default_progress_indicator.dart';
import '../../../../core/style/components/default_shimmer.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<CartBloc>(
        create: (context) => sl()
          ..add(
            CartGetProductsCartEvent(),
          ),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.productsCartState != RequestState.success) {
              return const Center(child: DefaultSpinKit());
            }
            if (state.productsCart.isEmpty) {
              return Center(
                child: DefaultAnimatedText(
                    text: 'Not Products Cart yet',
                    textStyle: Theme.of(context).textTheme.titleLarge),
              );
            }
            return Padding(
              padding: EdgeInsets.only(bottom: 5.0.r),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.productsCart.length,
                itemBuilder: (context, index) {
                  Cart cart = state.productsCart[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100.0.h,
                              width: 100.0.w,
                              child: CachedNetworkImage(
                                imageUrl: cart.image,
                                errorWidget: (context, url, error) =>
                                    const DefaultShimmer(),
                                placeholder: (context, url) =>
                                    const DefaultShimmer(),
                              ),
                            ),
                            SizedBox(
                              width: 5.0.w,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 8.0)
                                    .r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cart.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: 8.0.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'EGP ${cart.price.toString()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 5.0.w,
                                        ),
                                        if (cart.discount != 0)
                                          Text(
                                            'EGP ${cart.oldPrice.toString()}',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.0.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 123.6.w,
                              height: 30.0.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(12.0).r,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40.0.w,
                                    height: 30.0.h,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0.r),
                                        bottomLeft: Radius.circular(10.0.r),
                                      ),
                                    ),
                                    child: MaterialButton(
                                      onPressed: MyApp.productCartQuantity[
                                                      cart.productId] ==
                                                  1 ||
                                              isLoading(state)
                                          ? null
                                          : () {
                                              print(
                                                  'Quantity : ${cart.quantity}');
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
                                  SizedBox(
                                    width: 40.0.h,
                                    height: 30.h,
                                    child: Center(
                                      child: isLoading(state)
                                          ? const DefaultSpinKit()
                                          : Text(
                                              '${MyApp.productCartQuantity[cart.productId]}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                    ),
                                  ),
                                  Container(
                                    width: 40.0.w,
                                    height: 30.0.h,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0.r),
                                        bottomRight: Radius.circular(10.0.r),
                                      ),
                                    ),
                                    child: MaterialButton(
                                      onPressed: isLoading(state)
                                          ? null
                                          : () {
                                              print(
                                                  'Quantity : ${cart.quantity}');
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
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 100.0.w,
                              height: 30.0.h,
                              child: DefaultButton(
                                onPressed: () {},
                                text: 'Remove',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0).r,
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
            );
          },
        ),
      ),
    );
  }

  bool isLoading(CartState state) {
    if (state.updateState == RequestState.loading) {
      return true;
    }
    return false;
  }
}
