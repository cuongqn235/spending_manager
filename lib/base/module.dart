import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../inject_dependency/inject_dependency.dart';
import 'datasource/auth_interceptor.dart';
import 'datasource/base_api.dart';
import 'datasource/error_interceptor.dart';
import 'datasource/http_log_interceptor.dart';

@module
abstract class NetworkModule {
  @Named("baseUrl")
  String get baseUrl => '';
  @Named('defaultDio')
  Dio get dioDefault => _dio(baseUrl, _normalInterceptors);
  List<Interceptor> get _normalInterceptors => [
        ErrorInterceptor(),
        AuthInterceptor(getIt.call()),
        HttpLogInterceptor(),
      ];
  Dio _dio(
    String url,
    List<Interceptor> interceptors,
  ) {
    final dio = Http(
      baseUrl: url,
      inputInterceptors: interceptors,
    );
    return dio;
  }
}
