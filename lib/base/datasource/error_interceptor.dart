import 'package:dio/dio.dart';

import '../../helper/extensions/logger.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logD(err.message);
    super.onError(err, handler);
  }
}
