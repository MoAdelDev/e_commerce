import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autoValidateMode});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (p0) {},
          isHolderNameVisible: true,
          animationDuration: const Duration(milliseconds: 300),
          obscureCardCvv: true,
          backgroundImage: 'assets/images/card_background.png',
          cardBgColor: Colors.white,
          cardType: CardType.mastercard,
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          autovalidateMode: widget.autoValidateMode,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onFormComplete: () {},
          onCreditCardModelChange: (creditCardModel) {
            setState(() {
              cardNumber = creditCardModel.cardNumber;
              expiryDate = creditCardModel.expiryDate;
              cardHolderName = creditCardModel.cardHolderName;
              cvvCode = creditCardModel.cvvCode;
              showBackView = creditCardModel.isCvvFocused;
            });
          },
          formKey: widget.formKey,
          enableCvv: true,
          cardHolderValidator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter a valid card holder';
            }
            return null;
          },
        ),
      ],
    );
  }
}
