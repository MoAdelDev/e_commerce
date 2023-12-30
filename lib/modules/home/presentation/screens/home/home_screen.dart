import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/core/data/local/data.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_event.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Text(
                AppData.language == Language.arabic.name
                    ? state.arabicTitles[currentIndex]
                    : state.englishTitles[currentIndex],
              ),
              actions: [
                if (currentIndex == 0)
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteConst.productsSearchScreen);
                    },
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
              index: currentIndex,
              animationDuration: const Duration(milliseconds: 800),
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
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
                setState(() {
                  currentIndex = index;
                });
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
