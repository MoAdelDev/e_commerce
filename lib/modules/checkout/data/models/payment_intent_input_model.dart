class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(this.amount, this.currency, this.customerId);

  Map<String, dynamic> toJson() => {
        'amount': '${amount}00',
        'currency': currency,
        'customer': customerId,
      };
}
