import 'package:rizq/core/enums/category_field_type.dart';
import 'package:rizq/features/auth/register/data/models/register_request_model.dart';



class CategoryModel {
  final int id;
  final LocalizedName name;
  final String? image;
  final int status;
  final int? parentId;
  final LocalizedName? description;
  final int position;

  final List<CategoryModel> children;
  final List<CategoryFieldModel> categoryFields;
  final List<BrandModel> brands;

  CategoryModel({
    required this.id,
    required this.name,
    this.image,
    required this.status,
    this.parentId,
    this.description,
    required this.position,
    required this.children,
    required this.categoryFields,
    required this.brands,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: LocalizedName.fromJson(json : json['name']),
      image: json['image'] as String?,
      status: json['status'] ?? 0,
      parentId: json['parent_id'],
      description: json['description'] != null
          ? LocalizedName.fromJson(json : json['description'])
          : null,
      position: json['position'] ?? 0,
      children: (json['children'] as List? ?? [])
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      categoryFields: (json['category_fields'] as List? ?? [])
          .map((e) => CategoryFieldModel.fromJson(e))
          .toList(),
      brands: (json['brands'] as List? ?? [])
          .map((e) => BrandModel.fromJson(e))
          .toList(),
    );
  }
}

class CategoryFieldModel {
  final int id;
  final int categoryId;
  final LocalizedName fieldName;
  final CategoryFieldType fieldType;
  final bool required;
  final int order;
  final int status;

  /// Only used when fieldType == select
  final List<LocalizedName>? options;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  CategoryFieldModel({
    required this.id,
    required this.categoryId,
    required this.fieldName,
    required this.fieldType,
    required this.required,
    required this.order,
    required this.status,
    this.options,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryFieldModel.fromJson(Map<String, dynamic> json) {
    final optionsJson = json['options']?['en'];

    return CategoryFieldModel(
      id: json['id'],
      categoryId: json['category_id'],
      fieldName: LocalizedName.fromJson(json : json['field_name']),
      fieldType: CategoryFieldType.fromString(json['field_type']),
      required: json['required'] == 1,
      order: json['order'] ?? 0,
      status: json['status'] ?? 0,
      options: optionsJson is List
          ? optionsJson
          .map(
            (e) => LocalizedName.fromJson(json: e),
      )
          .toList()
          : null,
    );
  }
}

class BrandModel {
  final int id;
  final LocalizedName name;
  final int categoryId;


  BrandModel({
    required this.id,
    required this.name,
    required this.categoryId,

  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      name: LocalizedName.fromJson(json : json['name']),
      categoryId: json['category_id'],

    );
  }
}