// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Shop`
  String get appName {
    return Intl.message(
      'Shop',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInTitle {
    return Intl.message(
      'Sign In',
      name: 'signInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpTitle {
    return Intl.message(
      'Sign Up',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailHintTitle {
    return Intl.message(
      'Enter your email',
      name: 'emailHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHintTitle {
    return Intl.message(
      'Enter your password',
      name: 'passwordHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get loginTitle {
    return Intl.message(
      'LOGIN',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerTitle {
    return Intl.message(
      'Register',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Aren't you have an account ?`
  String get registerQuestion {
    return Intl.message(
      'Aren\'t you have an account ?',
      name: 'registerQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get nameHintTitle {
    return Intl.message(
      'Enter your name',
      name: 'nameHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone`
  String get phoneHintTitle {
    return Intl.message(
      'Enter your phone',
      name: 'phoneHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have been registered successfully`
  String get registerSuccessMsg {
    return Intl.message(
      'You have been registered successfully',
      name: 'registerSuccessMsg',
      desc: '',
      args: [],
    );
  }

  /// `you have been logged in successfully`
  String get loginSuccessMsg {
    return Intl.message(
      'you have been logged in successfully',
      name: 'loginSuccessMsg',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get productsTitle {
    return Intl.message(
      'Products',
      name: 'productsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionTitle {
    return Intl.message(
      'Description',
      name: 'descriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `DISCOUNT`
  String get discountTitle {
    return Intl.message(
      'DISCOUNT',
      name: 'discountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load data, try again`
  String get loadingDataErrorTitle {
    return Intl.message(
      'Failed to load data, try again',
      name: 'loadingDataErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCartTitle {
    return Intl.message(
      'Add to cart',
      name: 'addToCartTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remove from cart`
  String get removeFromCartTitle {
    return Intl.message(
      'Remove from cart',
      name: 'removeFromCartTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Products yet`
  String get noProductsTitle {
    return Intl.message(
      'No Products yet',
      name: 'noProductsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get removeTitle {
    return Intl.message(
      'Remove',
      name: 'removeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkoutTitle {
    return Intl.message(
      'Checkout',
      name: 'checkoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shop Products`
  String get onBoardingTitle {
    return Intl.message(
      'Shop Products',
      name: 'onBoardingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueTitle {
    return Intl.message(
      'Continue',
      name: 'continueTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
