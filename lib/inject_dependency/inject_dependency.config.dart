// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../base/datasource/api_service.dart' as _i4;
import '../base/datasource/local/auth/authentication_local_datasource.dart'
    as _i6;
import '../base/datasource/local/auth/i_authentication_local_datasource.dart'
    as _i5;
import '../base/module.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i3.Dio>(
      () => networkModule.dioDefault,
      instanceName: 'defaultDio',
    );
    gh.factory<_i4.IApiService>(
      () => _i4.DefaultApiService(gh<_i3.Dio>(instanceName: 'defaultDio')),
      instanceName: 'DefaultApiService',
    );
    gh.lazySingleton<_i5.IAuthenticationLocalDataSource>(() =>
        _i6.AuthenticationLocalDataSource(gh<_i7.FlutterSecureStorage>()));
    gh.factory<String>(
      () => networkModule.baseUrl,
      instanceName: 'baseUrl',
    );
    return this;
  }
}

class _$NetworkModule extends _i8.NetworkModule {}
