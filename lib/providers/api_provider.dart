import 'dart:convert';

import 'package:get/get.dart';

import '../data/auth_model.dart';

class ApiRequests extends GetConnect {
  ApiRequests();

  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 60);
    super.onInit();
  }

  Future<AuthResponse> SignInAndUp(
      String email, String password, String method) async {
    var body = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    Response response = await post(
        'https://identitytoolkit.googleapis.com/v1/accounts:$method?key=AIzaSyD-Fw_uXXKyZeO4HLEl3eCtRHqEuH5PLfw',
        body,
        contentType: 'application/json');
    return AuthResponse.fromJson(jsonDecode(response.bodyString!));
  }

  Future<AuthResponse> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    Response response = await post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD-Fw_uXXKyZeO4HLEl3eCtRHqEuH5PLfw',
        body,
        contentType: 'application/json');
    return AuthResponse.fromJson(jsonDecode(response.bodyString!));
  }

  Future<AuthResponse> signUp(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    Response response = await post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyD-Fw_uXXKyZeO4HLEl3eCtRHqEuH5PLfw',
        body,
        contentType: 'application/json');
    return AuthResponse.fromJson(jsonDecode(response.bodyString!));
  }
}
