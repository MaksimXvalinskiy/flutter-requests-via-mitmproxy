import 'package:proxy_interception_requests/features/model/domain/enums/request_package_type.dart';
import 'package:proxy_interception_requests/features/model/domain/models/products/list_all_products/list_all_products_entity.dart';
import 'package:proxy_interception_requests/features/model/services/base_service.dart';
import 'package:proxy_interception_requests/features/model/services/dio_service.dart';
import 'package:proxy_interception_requests/features/model/services/http_service.dart';
import 'package:proxy_interception_requests/features/model/singletons/request_packages_type_singleton.dart';

class ProductRepository {
  final BaseService _productsService =
      RequestPackagesTypeSingleton().getRequestPackageType ==
              RequestPackageType.http
          ? HttpService()
          : DioService();

  Future<ListAllProductEntity> getAllProducts() async {
    return await _productsService.getAllProducts();
  }

  Future<void> addProduct(String title) async {
    await _productsService.addProduct(title);
  }
}
