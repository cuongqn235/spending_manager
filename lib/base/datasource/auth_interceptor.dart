import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as app_dio;

import '../../helper/extensions/logger.dart';
import '../../inject_dependency/inject_dependency.dart';
import 'local/auth/i_authentication_local_datasource.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(
    this.authenticationDataSource,
  );

  final IAuthenticationLocalDataSource authenticationDataSource;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await authenticationDataSource.accessToken();

    if (accessToken == null) {
      try {
        final refreshAccessToken =
            await authenticationDataSource.refreshToken();
        if (refreshAccessToken != null) {
          options.headers[HeaderKey.headerAuthorizationKey] =
              refreshAccessToken;
        } else {
          handler.reject(RefreshTokenExpired(requestOptions: options));
        }
      } on DioError catch (e) {
        if ([403, 401].contains(e.response?.statusCode)) {
          handler.reject(RefreshTokenExpired(requestOptions: options));
        } else {
          handler.reject(e);
        }
      }
    } else {
      logD('Authorized! Put access token to header: $accessToken');
      options.headers[HeaderKey.headerAuthorizationKey] = accessToken;
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if ([403, 401].contains(err.response?.statusCode)) {
      try {
        final json = err.response?.data as Map<String, dynamic>;
        // final errorModel = ErrorResponse.fromJson(json);
        // final errorCode = errorModel.errorCode;
        // if (UserNotHavePermissionException.permissionErrorCodes
        //     .contains(errorCode)) {
        //   //if user role == staff and user call api don't have permission
        //   handler.reject(UserNotHavePermissionException(err));
        //   return;
        // }
        final accessToken = await authenticationDataSource.accessToken();

        if (accessToken != '' && accessToken != null) {
          await retry(err.requestOptions, accessToken);
        } else {
          handler
              .reject(RefreshTokenExpired(requestOptions: err.requestOptions));
        }
      } on Exception {
        handler.reject(RefreshTokenExpired(requestOptions: err.requestOptions));
      }
    } else {
      handler.reject(err);
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> retry(
    RequestOptions requestOptions,
    String accessToken,
  ) async {
    const httpTimeOut = 300000;
    logD('retry');
    final dio = app_dio.Dio(
      app_dio.BaseOptions(baseUrl: getIt.call(instanceName: 'baseUrl')),
    );

    requestOptions.headers[HeaderKey.headerAuthorizationKey] = accessToken;
    final options = Options(
      sendTimeout: const Duration(milliseconds: httpTimeOut),
      receiveTimeout: const Duration(milliseconds: httpTimeOut),
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path, options: options);
  }
}

class HeaderKey {
  HeaderKey._();

  static const String headerAuthorizationKey = 'Authorization';
  static const String platform = 'platform';
  static const String apiKey = 'apikey';
}

class RefreshTokenExpired extends DioError {
  RefreshTokenExpired({required super.requestOptions});
  @override
  String get message => 'Phiên đăng nhập kết thúc';
}
