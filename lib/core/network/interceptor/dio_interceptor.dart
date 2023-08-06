import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_assignment/config/app_config.dart';

import '../../constants/strings.dart';
import '../../injection/injection.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = '${getIt<AppConfig>().baseUrl}?key=$apiKey';
    options.connectTimeout = const Duration(seconds: 20);
    options.receiveTimeout = const Duration(seconds: 15);
    options.responseType = ResponseType.json;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("Error[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    super.onError(err, handler);
  }
}
