final class BouquetModel {

  final int id;
  final String name;
  final double price;
  final String description;
  final String currency;
  final int duration;
  final int adLimit;
  final int adFeaturedLimit;
  final int promotionOptions;
  final int possibilityOfAutomaticRenewal;
  final int status;

  BouquetModel(this.id, this.name, this.price, this.description, this.currency,
      this.duration, this.adLimit, this.adFeaturedLimit, this.promotionOptions,
      this.possibilityOfAutomaticRenewal, this.status);

  factory BouquetModel.fromJson(Map<String, dynamic> json) {
    return BouquetModel(
      json['id'] as int,
      json['name'] as String,
      double.parse(json['price'].toString()),
      json['description'] as String,
      json['currency'] as String,
      json['duration'] as int,
      json['ad_limit'] as int,
      json['ad_featured_limit'] as int,
      json['promotion_options'] as int,
      json['Possibility_of_automatic_renewal'] as int,
      json['status'] as int,
    );
  }


}
