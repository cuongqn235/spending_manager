import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'i_authentication_local_datasource.dart';

@LazySingleton(as: IAuthenticationLocalDataSource)
class AuthenticationLocalDataSource implements IAuthenticationLocalDataSource {
  final _accessTokenKey = 'ACCESS_TOKEN';
  final _refreshTokenKey = 'REFRESH_TOKEN';
  final _createPasswordTokenKey = 'CREATE_PASSWORD_TOKEN';
  final _otpVerifyTokenKey = 'OTP_VERIFY_TOKEN';
  final _passwordVerifyTokenKey = 'PASSWORD_VERIFY_TOKEN';
  final _userTypeKey = 'USER_TYPE_KEY';
  final FlutterSecureStorage storage;

  AuthenticationLocalDataSource(this.storage);
  @override
  Future<String?> accessToken() {
    return storage.read(key: _accessTokenKey);
  }

  @override
  Future<void> clearAccessToken() {
    return storage.delete(key: _accessTokenKey);
  }

  @override
  Future<void> clearRefreshToken() {
    return storage.delete(key: _refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    await storage.delete(key: _accessTokenKey);
    await storage.delete(key: _refreshTokenKey);
  }

  @override
  Future<String?> createPasswordToken() {
    return storage.read(key: _createPasswordTokenKey);
  }

  @override
  Future<String?> getUserType() {
    return storage.read(key: _userTypeKey);
  }

  @override
  Future<String?> otpVerifyToken() {
    return storage.read(key: _otpVerifyTokenKey);
  }

  @override
  Future<String?> passwordVerificationToken() {
    return storage.read(key: _passwordVerifyTokenKey);
  }

  @override
  Future<String?> refreshToken() {
    return storage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> setUserType(String? value) {
    return storage.write(key: _userTypeKey, value: value);
  }

  @override
  Future<void> storeAccessToken(String? accessToken) {
    return storage.write(key: _accessTokenKey, value: accessToken);
  }

  @override
  Future<void> storeCreatePassToken(String? token) {
    return storage.write(key: _createPasswordTokenKey, value: token);
  }

  @override
  Future<void> storeOtpVerifyToken(String? token) {
    return storage.write(key: _otpVerifyTokenKey, value: token);
  }

  @override
  Future<void> storePasswordVerificationToken(String? token) {
    return storage.write(key: _passwordVerifyTokenKey, value: token);
  }

  @override
  Future<void> storeRefreshToken(String? refreshToken) {
    return storage.write(key: _refreshTokenKey, value: refreshToken);
  }
}
