import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_event.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController(initialPage: 0);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColorLight.backgroundColor,
            appBar: AppBar(
              title: Text(
                MyApp.language == Language.arabic.name
                    ? state.arabicTitles[state.currentIndex]
                    : state.englishTitles[state.currentIndex],
              ),
              actions: [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              items: state.items,
              color: AppColorLight.primaryColor,
              height: 45.0,
              buttonBackgroundColor: AppColorLight.primaryColor,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              index: state.currentIndex,
              animationDuration: const Duration(milliseconds: 800),
              onTap: (index) {
                _pageController.jumpToPage(index);
                context.read<HomeBloc>().add(
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
                context.read<HomeBloc>().add(
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
