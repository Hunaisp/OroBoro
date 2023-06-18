import 'dart:convert';


import 'package:http/http.dart';

import '../modelclass/loginmodel.dart';
import 'apiclient.dart';


class LoginApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'Oroboro/Login';

  Future<LoginModel> postuserdata(String clientId,String userName, String password) async {
    var body = {'ClientId': clientId, 'UserName': userName,'Password':base64.encode(utf8.encode(password))};
    Response response = await apiClient.invokeAPI(trendingpath, 'POST_', jsonEncode(body));

    return LoginModel.fromJson(jsonDecode(response.body));
  }
}