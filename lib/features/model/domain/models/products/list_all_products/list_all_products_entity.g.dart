// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_all_products_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListAllProductEntityImpl _$$ListAllProductEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ListAllProductEntityImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$$ListAllProductEntityImplToJson(
        _$ListAllProductEntityImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
