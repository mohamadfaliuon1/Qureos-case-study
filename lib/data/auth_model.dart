class AuthResponse {
  String? token;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;
  bool? registered;
  dynamic error;
  AuthResponse(
      {this.token,
      this.email,
      this.refreshToken,
      this.expiresIn,
      this.localId,
      this.registered,
      this.error});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    token = json['idToken'];
    email = json['email'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
    localId = json['localId'];
    registered = json['registered'];
    error = json['error'];
  }
}

class AuthModel {
  String? token;
  String? email;

  AuthModel({
    required this.email,
    required this.token,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
  }
}
