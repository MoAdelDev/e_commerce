import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/search/search_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/search_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/search.dart';

class ProductsSearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  ProductsSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(sl()),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: TextFormField(
                controller: _searchController,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  hintText: S.of(context).searchHereTitle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColorLight.primaryColor.shade100),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColorLight.primaryColor.shade100),
                  ),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                onChanged: (value) {
                  context.read<SearchBloc>().add(SearchProductsEvent(value));
                },
                onFieldSubmitted: (value) {
                  context.read<SearchBloc>().add(SearchProductsEvent(value));
                },
              ),
            ),
            body: state.productsState == RequestState.loading
                ? const SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: DefaultProgressIndicator(
                        size: 70.0,
                      ),
                    ),
                  )
                : ListView.separated(
                    physics: DefaultScrollPhysics.defaultPhysics(),
                    itemBuilder: (context, index) {
                      Search search = state.products[index];
                      return SearchProductWidget(search: search);
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
                    itemCount: state.products.length),
          );
        },
      ),
    );
  }
}
