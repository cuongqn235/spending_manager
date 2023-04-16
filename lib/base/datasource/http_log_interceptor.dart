import 'package:dio/dio.dart';

import '../../helper/extensions/logger.dart';

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logW(
      '${options.uri} ---> [${options.method}] ${options.path}\n${options.data}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logI(
      '<--- [${response.requestOptions.method}]  '
      '${response.requestOptions.path}\n${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.data == null) {
      logE(
        '[${err.response?.statusCode}] ${err.requestOptions.method} '
        '${err.requestOptions.path}\n${err.toString()}',
      );
      super.onError(err, handler);
      return;
    }
    if (err.response?.data is String) {
      logE(err.response?.data);
    }

    if (err.response?.data is Map<String, dynamic>) {
      // final errorData = ErrorResponseModel.fromJson(
      //   err.response?.data as Map<String, Object?>,
      // );
      logE('[${err.response?.statusCode}] ${err.requestOptions.method} '
          // '${err.requestOptions.path}\n${errorData.toJson()}',
          );
    }

    super.onError(err, handler);
  }
}
