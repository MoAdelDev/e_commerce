import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_event.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/style/colors.dart';

class NightModeScreen extends StatelessWidget {
  const NightModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        int selectedNightMode = MyApp.isDark ? 1 : 2;
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).nightModeTitle),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selectedNightMode = 1;
                      context
                          .read<HomeBloc>()
                          .add(const HomeChangeNightModeEvent(true));
                    },
                    splashColor: AppColorLight.primaryColor.shade400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).onTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Radio(
                            value: 1,
                            groupValue: selectedNightMode,
                            splashRadius: 20,
                            onChanged: (value) {
                              selectedNightMode = 1;
                              context
                                  .read<HomeBloc>()
                                  .add(const HomeChangeNightModeEvent(true));
                            },
                            activeColor: AppColorLight.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selectedNightMode = 2;
                      context
                          .read<HomeBloc>()
                          .add(const HomeChangeNightModeEvent(false));
                    },
                    splashColor: AppColorLight.primaryColor.shade400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).offTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Radio(
                            value: 2,
                            groupValue: selectedNightMode,
                            splashRadius: 20.0,
                            onChanged: (value) {
                              selectedNightMode = 2;
                              context
                                  .read<HomeBloc>()
                                  .add(const HomeChangeNightModeEvent(false));
                            },
                            activeColor: AppColorLight.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
