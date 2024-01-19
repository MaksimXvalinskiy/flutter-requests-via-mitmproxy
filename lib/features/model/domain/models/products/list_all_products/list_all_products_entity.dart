import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proxy_interception_requests/features/model/domain/models/products/product/product_entity.dart';

part 'list_all_products_entity.freezed.dart';
part 'list_all_products_entity.g.dart';

@freezed
class ListAllProductEntity with _$ListAllProductEntity {
  const factory ListAllProductEntity({
    required List<ProductEntity> products,
    required int? total,
    required int? skip,
    required int? limit,
  }) = _ListAllProductEntity;

  factory ListAllProductEntity.fromJson(Map<String, Object?> json) =>
      _$ListAllProductEntityFromJson(json);
}
