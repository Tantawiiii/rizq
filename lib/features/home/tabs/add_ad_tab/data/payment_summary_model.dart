final class PaymentSummaryModel {
  final String whatHeBought;
  final double price;

  final double serviceFee;

  PaymentSummaryModel({required this.whatHeBought, required this.price, required this.serviceFee});
}