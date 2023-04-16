import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class Http extends DioForNative {
  final String baseUrl;
  final List<Interceptor>? inputInterceptors;
  final Map<String, dynamic>? headers;
  Http({
    required this.baseUrl,
    this.inputInterceptors,
    this.headers,
  }) {
    options.connectTimeout = const Duration(milliseconds: 5000);
    options.receiveTimeout = const Duration(milliseconds: 5000);
    options.followRedirects = false;
    options.validateStatus =
        (status) => (status != null) && (status >= 200 && status < 300);
    options.baseUrl = baseUrl;
    options.headers = headers ?? _headers;
    if (inputInterceptors != null) {
      for (final interceptor in inputInterceptors!) {
        interceptors.add(interceptor);
      }
    }
  }
  final Map<String, dynamic> _headers = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
    'Connection': 'keep-alive'
  };
}

mixin AppDioMixin {
  String get baseUrl;

  Interceptors? get inputInterceptors;

  Map<String, dynamic>? get headers => _headers;

  BaseOptions get options => _options;

  final Map<String, dynamic> _headers = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
    'Connection': 'keep-alive'
  };

  final BaseOptions _options = BaseOptions(
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
    followRedirects: false,
    validateStatus: (status) =>
        (status != null) && (status >= 200 && status < 300),
  );
}
