import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/components/default_progress_indicator.dart';
import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_event.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_state.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (MyApp.user == null) {
          return Container(
            color: Theme.of(context).colorScheme.background,
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: DefaultProgressIndicator(
                size: 60.0,
              ),
            ),
          );
        }
        return Container(
          color: Theme.of(context).colorScheme.background,
          width: double.infinity,
          child: SingleChildScrollView(
              physics: DefaultScrollPhysics.defaultPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundColor: AppColorLight.primaryColor,
                          child: const Icon(
                            Icons.person,
                            size: 35.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MyApp.user?.name ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontFamily: AppFonts.boldFont),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              MyApp.user?.email ?? '',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultButton(
                      onPressed: () => Navigator.pushNamed(context, RouteConst.updateProfileScreen),
                      text: S.of(context).updateProfileTitle,
                      icon: Icons.edit,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: [
                        SettingsItemWidget(
                            onPressed: () => Navigator.pushNamed(
                                context, RouteConst.addressScreen),
                            icon: Icons.location_history,
                            text: S.of(context).myAddressesTitle),
                        SettingsItemWidget(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteConst.languageScreen);
                          },
                          icon: Icons.language,
                          text: S.of(context).languageTitle,
                          isLanguage: true,
                        ),
                        SettingsItemWidget(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteConst.nightModeScreen);
                          },
                          icon: Icons.nightlight_round,
                          text: S.of(context).nightModeTitle,
                          isNightMode: true,
                        ),
                        SettingsItemWidget(
                            onPressed: () {},
                            icon: Icons.article,
                            text: S.of(context).faqsTitle),
                        SettingsItemWidget(
                            onPressed: () => Navigator.pushNamed(context, RouteConst.contactsScreen),
                            icon: Icons.contacts,
                            text: S.of(context).contactsTitle),
                        SettingsItemWidget(
                          onPressed: () {
                            context
                                .read<HomeBloc>()
                                .add(HomeSignOutEvent(context));
                          },
                          icon: Icons.logout,
                          textColor: AppColorLight.errorColor,
                          text: S.of(context).logoutTitle,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
