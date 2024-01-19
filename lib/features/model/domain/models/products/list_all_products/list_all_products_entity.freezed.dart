// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_all_products_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListAllProductEntity _$ListAllProductEntityFromJson(Map<String, dynamic> json) {
  return _ListAllProductEntity.fromJson(json);
}

/// @nodoc
mixin _$ListAllProductEntity {
  List<ProductEntity> get products => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get skip => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListAllProductEntityCopyWith<ListAllProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListAllProductEntityCopyWith<$Res> {
  factory $ListAllProductEntityCopyWith(ListAllProductEntity value,
          $Res Function(ListAllProductEntity) then) =
      _$ListAllProductEntityCopyWithImpl<$Res, ListAllProductEntity>;
  @useResult
  $Res call({List<ProductEntity> products, int? total, int? skip, int? limit});
}

/// @nodoc
class _$ListAllProductEntityCopyWithImpl<$Res,
        $Val extends ListAllProductEntity>
    implements $ListAllProductEntityCopyWith<$Res> {
  _$ListAllProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = freezed,
    Object? skip = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      skip: freezed == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListAllProductEntityImplCopyWith<$Res>
    implements $ListAllProductEntityCopyWith<$Res> {
  factory _$$ListAllProductEntityImplCopyWith(_$ListAllProductEntityImpl value,
          $Res Function(_$ListAllProductEntityImpl) then) =
      __$$ListAllProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductEntity> products, int? total, int? skip, int? limit});
}

/// @nodoc
class __$$ListAllProductEntityImplCopyWithImpl<$Res>
    extends _$ListAllProductEntityCopyWithImpl<$Res, _$ListAllProductEntityImpl>
    implements _$$ListAllProductEntityImplCopyWith<$Res> {
  __$$ListAllProductEntityImplCopyWithImpl(_$ListAllProductEntityImpl _value,
      $Res Function(_$ListAllProductEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = freezed,
    Object? skip = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$ListAllProductEntityImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      skip: freezed == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListAllProductEntityImpl implements _ListAllProductEntity {
  const _$ListAllProductEntityImpl(
      {required final List<ProductEntity> products,
      required this.total,
      required this.skip,
      required this.limit})
      : _products = products;

  factory _$ListAllProductEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListAllProductEntityImplFromJson(json);

  final List<ProductEntity> _products;
  @override
  List<ProductEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int? total;
  @override
  final int? skip;
  @override
  final int? limit;

  @override
  String toString() {
    return 'ListAllProductEntity(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListAllProductEntityImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_products), total, skip, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListAllProductEntityImplCopyWith<_$ListAllProductEntityImpl>
      get copyWith =>
          __$$ListAllProductEntityImplCopyWithImpl<_$ListAllProductEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListAllProductEntityImplToJson(
      this,
    );
  }
}

abstract class _ListAllProductEntity implements ListAllProductEntity {
  const factory _ListAllProductEntity(
      {required final List<ProductEntity> products,
      required final int? total,
      required final int? skip,
      required final int? limit}) = _$ListAllProductEntityImpl;

  factory _ListAllProductEntity.fromJson(Map<String, dynamic> json) =
      _$ListAllProductEntityImpl.fromJson;

  @override
  List<ProductEntity> get products;
  @override
  int? get total;
  @override
  int? get skip;
  @override
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$ListAllProductEntityImplCopyWith<_$ListAllProductEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
