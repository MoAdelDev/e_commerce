import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/category_details/category_details_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/category_details/category_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final ScreenArgs screenArgs;

  const CategoryDetailsScreen({super.key, required this.screenArgs});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(screenArgs.categoryName),
        ),
        body: BlocProvider<CategoryDetailsBloc>(
          create: (context) => CategoryDetailsBloc(
            sl(),
            sl(),
            sl(),
          )..add(CategoryDetailsGetEvent(screenArgs.categoryId)),
          child: BlocBuilder<CategoryDetailsBloc, CategoryDetailsState>(
            builder: (context, state) {
              if (state.productsState != RequestState.success &&
                  MyApp.favoriteMap.isEmpty &&
                  MyApp.productCartQuantity.isEmpty) {
                return const Center(
                  child: DefaultProgressIndicator(
                    size: 70.0,
                  ),
                );
              } else if (state.products.isEmpty) {
                return const Center(
                  child: DefaultProgressIndicator(
                    size: 70.0,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ListView.separated(
                  physics: DefaultScrollPhysics.defaultPhysics(),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    Product product = state.products[index];
                    return CategoryProductWidget(
                      product: product,
                    );
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Divider(
                        color: Colors.grey[400],
                        height: 1,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
