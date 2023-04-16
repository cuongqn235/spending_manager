import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

abstract class IApiService {
  Future<T> post<T>(
    String path,
    Object? body, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic> json)? resultParser,
  });

  Future<T> put<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic> json)? resultParser,
  });

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic> json)? resultParser,
  });

  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    Object? body,
    T Function(Map<String, dynamic> json)? resultParser,
  });

  Future<List<T>> postWithListResponse<T>(
    String path,
    Object body, {
    Map<String, dynamic>? queryParameters,
    List<T> Function(List<Map<String, dynamic>> result)? resultParser,
  });

  Future<List<T>> putWithListResponse<T>(
    String path,
    Object body, {
    Map<String, dynamic>? queryParameters,
    List<T> Function(List<Map<String, dynamic>> result)? resultParser,
  });

  Future<List<T>> getWithListResponse<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    List<T> Function(List<Map<String, dynamic>> result)? resultParser,
  });

  Future<List<T>> deleteWithListResponse<T>(
    String path,
    Object? body, {
    Map<String, dynamic>? queryParams,
    List<T> Function(List<Map<String, dynamic>> result)? resultParser,
  });

  Future<void> downloadFile(
    String fileUrl,
    String filePath,
    Function(int, int) onReceiveProgress,
  );
}

abstract class ApiService implements IApiService {
  Dio dio;

  /// inject dio by DI
  ApiService(this.dio);

  @override
  @protected
  Future<T> post<T>(
    String path,
    Object? body, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic> json)? resultParser,
  }) async {
    return _post<T>(
      path,
      body,
      queryParameters: queryParameters,
      resultParser:
          resultParser != null ? (value) => resultParser.call(value) : null,
    );
  }

  @override
  @protected
  Future<T> put<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic> json)? resultParser,
  }) {
    return _put<T>(
      path,
      body: body,
      queryParameters: queryParameters,
      resultParser:
          resultParser != null ? (value) => resultParser.call(value) : null,
    );
  }

  @override
  @protected
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic> json)? resultParser,
  }) {
    return _get<T>(
      path,
      queryParams: queryParams,
      resultParser:
          resultParser != null ? (value) => resultParser.call(value) : null,
    );
  }

  @override
  @protected
  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    Object? body,
    T Function(Map<String, Object?> json)? resultParser,
  }) {
    return _delete<T>(
      path,
      body,
      queryParams: queryParams,
      resultParser:
          resultParser != null ? (value) => resultParser.call(value) : null,
    );
  }

  @override
  Future<List<T>> deleteWithListResponse<T>(
    String path,
    Object? body, {
    Map<String, dynamic>? queryParams,
    List<T> Function(List<Map<String, dynamic>> result)? resultParser,
  }) {
    return _delete<List<T>>(
      path,
      body,
      queryParams: queryParams,
      resultParser: resultParser != null
          ? (value) {
              return resultParser.call((value as List<dynamic>)
                  .map((e) => e as Map<String, dynamic>)
                  .toList());
            }
          : null,
    );
  }

  @override
  Future<List<T>> getWithListResponse<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    List<T> Function(List<Map<String, dynamic>> result)? resultParser,
  }) {
    return _get<List<T>>(
      path,
      queryParams: queryParams,
      resultParser: resultParser != null
          ? (value) {
              return resultParser.call((value as List<dynamic>)
                  .map((e) => e as Map<String, dynamic>)
                  .toList());
            }
          : null,
    );
  }

  @override
  Future<List<T>> postWithListResponse<T>(String path, Object body,
      {Map<String, dynamic>? queryParameters,
      List<T> Function(List<Map<String, dynamic>> result)? resultParser}) {
    return _post<List<T>>(
      path,
      body,
      queryParameters: queryParameters,
      resultParser: resultParser != null
          ? (value) {
              return resultParser.call((value as List<dynamic>)
                  .map((e) => e as Map<String, dynamic>)
                  .toList());
            }
          : null,
    );
  }

  @override
  Future<List<T>> putWithListResponse<T>(
    String path,
    Object body, {
    Map<String, dynamic>? queryParameters,
    List<T> Function(List<Map<String, dynamic>> result)? resultParser,
  }) {
    return _put<List<T>>(
      path,
      body: body,
      queryParameters: queryParameters,
      resultParser: resultParser != null
          ? (value) {
              return resultParser.call((value as List<dynamic>)
                  .map((e) => e as Map<String, dynamic>)
                  .toList());
            }
          : null,
    );
  }

  Future<T> _post<T>(
    String path,
    Object? body, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic value)? resultParser,
  }) async {
    return dio
        .post(path, data: body, queryParameters: queryParameters)
        .then((value) => () {
              if (resultParser == null) {
                return value.data;
              } else {
                return resultParser.call(value.data);
              }
            }());
  }

  Future<T> _put<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic value)? resultParser,
  }) async {
    return dio
        .put(path, data: body, queryParameters: queryParameters)
        .then((value) => () {
              if (resultParser == null) {
                return value.data;
              } else {
                return resultParser.call(value.data);
              }
            }());
  }

  Future<T> _get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    T Function(dynamic value)? resultParser,
  }) async {
    return dio.get(path, queryParameters: queryParams).then((value) => () {
          if (resultParser == null) {
            return value.data;
          } else {
            return resultParser.call(value.data);
          }
        }());
  }

  Future<T> _delete<T>(
    String path,
    Object? body, {
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? resultParser,
  }) async {
    return dio
        .delete(path, data: body, queryParameters: queryParams)
        .then((value) => () {
              if (resultParser == null) {
                return value.data;
              } else {
                return resultParser.call(value.data);
              }
            }());
  }

  @override
  Future<void> downloadFile(
      String fileUrl, String filePath, Function(int, int) onReceiveProgress) {
    return dio
        .download(
      fileUrl,
      filePath,
      onReceiveProgress: onReceiveProgress,
    )
        .then((value) {
      return;
    });
  }
}

// @named
// @Injectable(as: IApiService)
// class AuthApiService extends ApiService {
//   AuthApiService(@Named('authDio') super.dio);
// }

@named
@Injectable(as: IApiService)
class DefaultApiService extends ApiService {
  DefaultApiService(@Named('defaultDio') super.dio);
}

// @named
// @Injectable(as: IApiService)
// class GoogleMapApiService extends ApiService {
//   GoogleMapApiService(@Named('googleMapDio') super.dio);
// }

// class ImageApiService extends ApiService {
//   @override
//   final Dio dio;

//   ImageApiService(this.dio) : super(dio);
// }

// class NotificationApiService extends ApiService {
//   @override
//   final Dio dio;

//   NotificationApiService(this.dio) : super(dio);
// }

// class EstateRevenueService extends ApiService {
//   @override
//   final Dio dio;

//   EstateRevenueService(this.dio) : super(dio);
// }
