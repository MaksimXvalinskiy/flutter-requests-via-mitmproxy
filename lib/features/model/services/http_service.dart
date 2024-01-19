import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proxy_interception_requests/features/model/domain/models/products/list_all_products/list_all_products_entity.dart';
import 'package:proxy_interception_requests/features/model/services/base_service.dart';
import 'package:proxy_interception_requests/network/app_exception.dart';

class HttpService extends BaseService {
  @override
  Future<ListAllProductEntity> getAllProducts() async {
    final response = returnResponse(
        await http.get(Uri.parse('https://dummyjson.com/products')));
    return ListAllProductEntity.fromJson(response);
  }

  @override
  Future<void> addProduct(
    String title,
  ) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/products/add'),
      body: jsonEncode(
        {
          'title': title,
        },
      ),
    );
    returnResponse(response);
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
