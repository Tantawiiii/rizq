class ProductDetails {
  const ProductDetails({
    required this.id,
    required this.title,
    required this.images,
    required this.currentPrice,
    required this.oldPrice,
    required this.description,
    required this.seller,
    required this.location,
    required this.specifications,
    required this.relatedAds,
  });

  final String id;
  final String title;
  final List<String> images;
  final String currentPrice;
  final String oldPrice;
  final String description;
  final SellerInfo seller;
  final LocationInfo location;
  final ProductSpecifications specifications;
  final List<RelatedAd> relatedAds;
}

class SellerInfo {
  const SellerInfo({
    required this.name,
    required this.role,
    required this.memberSince,
    required this.rating,
    required this.profileImage,
  });

  final String name;
  final String role;
  final String memberSince;
  final double rating;
  final String profileImage;
}

class LocationInfo {
  const LocationInfo({
    required this.city,
    required this.neighborhood,
    required this.latitude,
    required this.longitude,
  });

  final String city;
  final String neighborhood;
  final double latitude;
  final double longitude;
}

class ProductSpecifications {
  const ProductSpecifications({
    required this.model,
    required this.brand,
    required this.color,
    required this.storageCapacity,
    required this.batteryHealth,
    required this.condition,
    required this.subCategory,
    required this.mainCategory,
    required this.neighborhood,
    required this.city,
    required this.accessories,
  });

  final String model;
  final String brand;
  final String color;
  final String storageCapacity;
  final String batteryHealth;
  final String condition;
  final String subCategory;
  final String mainCategory;
  final String neighborhood;
  final String city;
  final String accessories;
}

class RelatedAd {
  const RelatedAd({
    required this.title,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  final String title;
  final String image;
  final String price;
  final String oldPrice;
  final String discount;
}

