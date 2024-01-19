import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String title,
    required String description,
    required double? price,
    required double? discountPercentage,
    required double? rating,
    required int? stock,
    required String brand,
    required String category,
    required String thumbnail,
    required List<String?> images,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, Object?> json) =>
      _$ProductEntityFromJson(json);
}
