
class AdItem {
  const AdItem({
    required this.title,
    required this.imageAsset,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  final String title;
  final String imageAsset;
  final String price;
  final String oldPrice;
  final String discount;
}