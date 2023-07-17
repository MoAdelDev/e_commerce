import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/products/products_bloc.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/products/products_event.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController(initialPage: 0);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Softagi',
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              items: state.items,
              color: Theme.of(context).colorScheme.primary,
              height: 45.0.h,
              buttonBackgroundColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              index: state.currentIndex,
              animationDuration: const Duration(milliseconds: 800),
              onTap: (index) {
                _pageController.jumpToPage(index);
                context.read<ProductsBloc>().add(
                      HomeChangeBottomNavIndexEvent(index),
                    );
              },
            ),
            body: PageView(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: state.screens.map((e) => e).toList(),
              onPageChanged: (index) {
                context.read<ProductsBloc>().add(
                      HomeChangeBottomNavIndexEvent(index),
                    );
              },
            ),
          ),
        );
      },
    );
  }
}
