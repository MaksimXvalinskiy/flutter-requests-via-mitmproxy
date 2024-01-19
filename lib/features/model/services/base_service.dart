import 'package:proxy_interception_requests/features/model/domain/models/products/list_all_products/list_all_products_entity.dart';

abstract class BaseService {
  Future<ListAllProductEntity> getAllProducts();
  Future<void> addProduct(
    String title,
  );
}
