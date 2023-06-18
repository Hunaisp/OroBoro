import 'dart:convert';


import 'package:http/http.dart';

import '../modelclass/OtpModel.dart';
import 'apiclient.dart';


class OtpApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'Oroboro/MobileVerification';

  Future<OtpModel> getOtp(String clientId, String phone) async {
    var body = {'ClientId': clientId, 'Mobile': phone};
    Response response = await apiClient.invokeAPI(trendingpath, 'POST_', jsonEncode(body));

    return OtpModel.fromJson(jsonDecode(response.body));
  }
}
