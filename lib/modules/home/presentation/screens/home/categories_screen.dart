import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/style/components/default_shimmer.dart';
import '../../controller/home/home_bloc.dart';
import '../../controller/home/home_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.categoriesState != RequestState.success) {
            return Container(
              color: Theme.of(context).colorScheme.background,
              child: ListView.separated(
                  physics: DefaultScrollPhysics.defaultPhysics(),
                  itemBuilder: (context, index) => const SizedBox(
                        height: 100.0,
                        width: double.infinity,
                        child: DefaultShimmer(),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 8.0,
                      ),
                  itemCount: 30),
            );
          }
          return Container(
            color: Theme.of(context).colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ListView.separated(
                  physics: DefaultScrollPhysics.defaultPhysics(),
                  itemBuilder: (context, index) {
                    Category category = state.categories[index];
                    return Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: category.image,
                          height: 100.0,
                          width: 100.0,
                          placeholder: (context, url) => const DefaultShimmer(),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Text(
                            category.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: IconButton(
                            onPressed: () {
                              ScreenArgs args = ScreenArgs.toCategoryDetails(
                                  category.id, category.name);
                              Navigator.pushNamed(
                                  context, RouteConst.categoryDetailsScreen,
                                  arguments: args);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 8.0,
                        ),
                        child: Divider(
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                      ),
                  itemCount: state.categories.length),
            ),
          );
        },
      ),
    );
  }
}
