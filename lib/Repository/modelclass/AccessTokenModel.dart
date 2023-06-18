class AccessTokenModel {
  AccessTokenModel({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn, 
      this.refreshToken, 
      this.issued, 
      this.expires,});

  AccessTokenModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    issued = json['.issued'];
    expires = json['.expires'];
  }
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? refreshToken;
  String? issued;
  String? expires;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    map['refresh_token'] = refreshToken;
    map['.issued'] = issued;
    map['.expires'] = expires;
    return map;
  }

}