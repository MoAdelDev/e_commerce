import 'package:e_commerce_app/core/data/local/data.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_event.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        int selectedLanguage = AppData.language == Language.english.name ? 1 : 2;
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).languageTitle),
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
                      selectedLanguage = 1;
                      context
                          .read<HomeBloc>()
                          .add(HomeChangeLanguageEvent(Language.english.name));
                    },
                    splashColor: AppColorLight.primaryColor.shade400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).englishTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Radio(
                            value: 1,
                            groupValue: selectedLanguage,
                            splashRadius: 20,
                            onChanged: (value) {
                              selectedLanguage = value ?? 1;
                              context.read<HomeBloc>().add(
                                  HomeChangeLanguageEvent(
                                      Language.english.name));
                            },
                            activeColor: AppColorLight.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selectedLanguage = 2;
                      context
                          .read<HomeBloc>()
                          .add(HomeChangeLanguageEvent(Language.arabic.name));
                    },
                    splashColor: AppColorLight.primaryColor.shade400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).arabicTitleTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Radio(
                            value: 2,
                            groupValue: selectedLanguage,
                            splashRadius: 20.0,
                            onChanged: (value) {
                              selectedLanguage = value ?? 2;
                              context.read<HomeBloc>().add(
                                  HomeChangeLanguageEvent(
                                      Language.arabic.name));
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
