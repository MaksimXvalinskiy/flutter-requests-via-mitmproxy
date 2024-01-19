import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:proxy_interception_requests/features/model/domain/models/products/list_all_products/list_all_products_entity.dart';
import 'package:proxy_interception_requests/features/model/services/base_service.dart';
import 'package:proxy_interception_requests/features/model/singletons/request_packages_type_singleton.dart';
import 'package:proxy_interception_requests/network/app_exception.dart';

class DioService extends BaseService {
  Dio get dio => RequestPackagesTypeSingleton().dio!;
  @override
  Future<ListAllProductEntity> getAllProducts() async {
    final response = returnResponse(await dio.get('products'));
    return ListAllProductEntity.fromJson(response);
  }

  @override
  Future<void> addProduct(
    String title,
  ) async {
    final response = await dio.post(
      'products/add',
      data: jsonEncode(
        {
          'title': title,
        },
      ),
    );
    returnResponse(response);
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data['errors']);
      case 404:
        throw BadRequestException(response.data['errors']);
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
