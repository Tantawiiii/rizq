final class GovernorateModel {
  final int id;
  final String name;

  GovernorateModel({
    required this.id,
    required this.name,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>
      GovernorateModel(
        id: json['id'],
        name: json['name'],
      );
}