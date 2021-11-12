import 'dart:convert';

import 'package:flutter_api_auth/app/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  final client = http.Client();

  Future<dynamic> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String password2,
  }) async {
    final Uri uri = Uri.parse(ApiRoutes.BaseUrl + "/register");
    final headers = {"Content-type": "application/json"};

    final http.Response response = await client.post(
      uri,
      headers: headers,
      body: jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "password2": password2,
      }),
    );

    return response.body;
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    final Uri uri = Uri.parse(ApiRoutes.BaseUrl + "/login");
    final headers = {"Content-type": "application/json"};

    final http.Response response = await client.post(
      uri,
      headers: headers,
      body: jsonEncode({"email": email, "password": password}),
    );

    return response.body;
  }
}
