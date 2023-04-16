// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../base/datasource/local/auth/authentication_local_datasource.dart'
    as _i5;
import '../base/datasource/local/auth/i_authentication_local_datasource.dart'
    as _i4;
import '../base/module.dart' as _i7;

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
    gh.lazySingleton<_i4.IAuthenticationLocalDataSource>(() =>
        _i5.AuthenticationLocalDataSource(gh<_i6.FlutterSecureStorage>()));
    gh.factory<String>(
      () => networkModule.baseUrl,
      instanceName: 'baseUrl',
    );
    return this;
  }
}

class _$NetworkModule extends _i7.NetworkModule {}
