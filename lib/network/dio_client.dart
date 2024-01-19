import 'dart:developer';

import 'package:dio/dio.dart';

Dio dioClient(
  String baseUrl, {
  bool withAuth = false,
}) {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
  dio.interceptors.addAll([
    MyInterceptor(),
  ]);
  return dio;
}

class MyInterceptor extends Interceptor {
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    String? serverErrorText;

    if (err.response != null &&
        (err.response?.statusCode == 400 || err.response?.statusCode == 404)) {
      // Server error
      final serverError = err.response!;
      try {
        serverErrorText = serverError.data;
      } catch (e) {
        log(e.toString());
      }
    }
    log("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
    handler.resolve(
      Response(
        requestOptions: err.requestOptions,
        data: {
          'runtimeType': 'errors',
          'success': false,
          'data': null,
          'errors': serverErrorText ?? 'An unknown error has occurred',
        },
        statusCode: err.response?.statusCode,
      ),
    );
  }
}
