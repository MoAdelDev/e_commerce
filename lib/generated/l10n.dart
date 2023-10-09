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

  /// `Forgot password ?`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot password ?',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update profile`
  String get updateProfileTitle {
    return Intl.message(
      'Update profile',
      name: 'updateProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `My addresses`
  String get myAddressesTitle {
    return Intl.message(
      'My addresses',
      name: 'myAddressesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notificationsTitle {
    return Intl.message(
      'Notifications',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageTitle {
    return Intl.message(
      'Language',
      name: 'languageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Night mode`
  String get nightModeTitle {
    return Intl.message(
      'Night mode',
      name: 'nightModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `FAQS`
  String get faqsTitle {
    return Intl.message(
      'FAQS',
      name: 'faqsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contactsTitle {
    return Intl.message(
      'Contacts',
      name: 'contactsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get offTitle {
    return Intl.message(
      'Off',
      name: 'offTitle',
      desc: '',
      args: [],
    );
  }

  /// `On`
  String get onTitle {
    return Intl.message(
      'On',
      name: 'onTitle',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishTitle {
    return Intl.message(
      'English',
      name: 'englishTitle',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabicTitleTitle {
    return Intl.message(
      'Arabic',
      name: 'arabicTitleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logoutTitle {
    return Intl.message(
      'Log out',
      name: 'logoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get addNewAddress {
    return Intl.message(
      'Add new address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit address`
  String get editNewAddress {
    return Intl.message(
      'Edit address',
      name: 'editNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullNameTitle {
    return Intl.message(
      'Full name',
      name: 'fullNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get fullNameHintTitle {
    return Intl.message(
      'Enter your full name',
      name: 'fullNameHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get addressTitle {
    return Intl.message(
      'Address',
      name: 'addressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your address`
  String get addressHintTitle {
    return Intl.message(
      'Enter your address',
      name: 'addressHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get cityTitle {
    return Intl.message(
      'City',
      name: 'cityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your city`
  String get cityHintTitle {
    return Intl.message(
      'Enter your city',
      name: 'cityHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get regionTitle {
    return Intl.message(
      'Region',
      name: 'regionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your region`
  String get regionHintTitle {
    return Intl.message(
      'Enter your region',
      name: 'regionHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get noteTitle {
    return Intl.message(
      'Notes',
      name: 'noteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your notes`
  String get noteHintTitle {
    return Intl.message(
      'Enter your notes',
      name: 'noteHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete this address ?`
  String get deleteAddressQuestionTitle {
    return Intl.message(
      'Delete this address ?',
      name: 'deleteAddressQuestionTitle',
      desc: '',
      args: [],
    );
  }

  /// `This address will be permanently deleted .`
  String get deleteAddressBodyTitle {
    return Intl.message(
      'This address will be permanently deleted .',
      name: 'deleteAddressBodyTitle',
      desc: '',
      args: [],
    );
  }

  /// `No addresses yet`
  String get noAddressTitle {
    return Intl.message(
      'No addresses yet',
      name: 'noAddressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameTitle {
    return Intl.message(
      'Name',
      name: 'nameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailTitle {
    return Intl.message(
      'Email',
      name: 'emailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phoneTitle {
    return Intl.message(
      'Phone',
      name: 'phoneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordTitle {
    return Intl.message(
      'Password',
      name: 'passwordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search here ...`
  String get searchHereTitle {
    return Intl.message(
      'Search here ...',
      name: 'searchHereTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm order`
  String get confirmOrderTitle {
    return Intl.message(
      'Confirm order',
      name: 'confirmOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Order summary`
  String get orderSummaryTitle {
    return Intl.message(
      'Order summary',
      name: 'orderSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fees`
  String get deliveryFeesTitle {
    return Intl.message(
      'Delivery Fees',
      name: 'deliveryFeesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Item's total`
  String get itemTotalTitle {
    return Intl.message(
      'Item\'s total',
      name: 'itemTotalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get freeTitle {
    return Intl.message(
      'Free',
      name: 'freeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get totalTitle {
    return Intl.message(
      'Total',
      name: 'totalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter code here`
  String get codeHintTitle {
    return Intl.message(
      'Enter code here',
      name: 'codeHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `APPLY`
  String get applyTitle {
    return Intl.message(
      'APPLY',
      name: 'applyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethodTitle {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethodTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cash On Delivery`
  String get cashOnDeliveryTitle {
    return Intl.message(
      'Cash On Delivery',
      name: 'cashOnDeliveryTitle',
      desc: '',
      args: [],
    );
  }

  /// `COD is a type of transaction where the recipient pays for a good at the time of delivery rather than using credit`
  String get cashOnDeliveryBody {
    return Intl.message(
      'COD is a type of transaction where the recipient pays for a good at the time of delivery rather than using credit',
      name: 'cashOnDeliveryBody',
      desc: '',
      args: [],
    );
  }

  /// `CHANGE`
  String get changeTitle {
    return Intl.message(
      'CHANGE',
      name: 'changeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get deliveryTitle {
    return Intl.message(
      'Delivery',
      name: 'deliveryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Modify cart`
  String get modifyCartTitle {
    return Intl.message(
      'Modify cart',
      name: 'modifyCartTitle',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantityTitle {
    return Intl.message(
      'Quantity',
      name: 'quantityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get ordersTitle {
    return Intl.message(
      'Orders',
      name: 'ordersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel order`
  String get cancelOrder {
    return Intl.message(
      'Cancel order',
      name: 'cancelOrder',
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
