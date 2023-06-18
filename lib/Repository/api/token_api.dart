import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oroborocompany/main.dart';

import '../modelclass/AccessTokenModel.dart';

import 'multi_patch_method_api_client.dart';

class TokenApi {
  Future<String?> getToken(String username, String password) async {
    final tokenUrl = basePath+'token';

    final body = {
      'username': username,
      'password': base64.encode(utf8.encode(password)),
      'grant_type': 'password',
    };

    final response = await http.post(Uri.parse(tokenUrl), body: body);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final accessToken = jsonResponse['access_token'];
      return accessToken;
    } else {
      print('Token request failed with status code: ${response.statusCode}');
      return null;
    }
  }
}