abstract class IAuthenticationLocalDataSource {
  Future<String?> accessToken();

  Future<void> storeAccessToken(String? accessToken);

  Future<String?> refreshToken();

  Future<void> storeRefreshToken(String? refreshToken);

  Future<void> storeCreatePassToken(String? token);

  Future<String?> createPasswordToken();

  Future<void> storeOtpVerifyToken(String? token);

  Future<String?> otpVerifyToken();

  Future<void> storePasswordVerificationToken(String? token);

  Future<String?> passwordVerificationToken();

  Future<void> clearTokens();
  Future<void> clearAccessToken();
  Future<void> clearRefreshToken();

  Future<String?> getUserType();

  Future<void> setUserType(String? value);
}
