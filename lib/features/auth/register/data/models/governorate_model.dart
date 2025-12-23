import 'package:rizq/features/auth/register/data/models/register_request_model.dart';

final class GovernorateModel {
  final int id;
  final LocalizedName name;
  final String latitude;
  final String longitude;

  GovernorateModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>
      GovernorateModel(
        id: json['id'],
        name: LocalizedName.fromJson(json: json['name']),
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
}