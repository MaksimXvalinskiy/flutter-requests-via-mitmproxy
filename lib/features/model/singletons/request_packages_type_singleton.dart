import 'package:dio/dio.dart';
import 'package:proxy_interception_requests/features/model/domain/enums/request_package_type.dart';
import 'package:proxy_interception_requests/network/dio_client.dart';

class RequestPackagesTypeSingleton {
  static final RequestPackagesTypeSingleton _singleton =
      RequestPackagesTypeSingleton._internal();

  factory RequestPackagesTypeSingleton() {
    return _singleton;
  }

  RequestPackagesTypeSingleton._internal();

  RequestPackageType? _requestPackageType;
  RequestPackageType? get getRequestPackageType => _requestPackageType;

  Dio? dio;

  Future<void> setup(RequestPackageType requestPackageType) async {
    if (requestPackageType == RequestPackageType.dio) {
      dio = dioClient('https://dummyjson.com/');
    }
    _requestPackageType = requestPackageType;
  }

  void clean() {
    dio = null;
  }
}
