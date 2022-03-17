import '../../../../../../data/models/models/remote/dbh_api/topics/user/refresh_token_request.dart';

class UserParamsRefreshToken {
  final String bearerToken;
  final RefreshTokenRequest refreshTokenRequest;
  UserParamsRefreshToken({
    required this.bearerToken,
    required this.refreshTokenRequest,
  });
}
