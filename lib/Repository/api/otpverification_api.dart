import 'dart:convert';


import 'package:http/http.dart';

import '../modelclass/OtpVerifiactionModel.dart';

import 'apiclient.dart';


class OtpVerificationApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = 'Oroboro/MobileOTPVerification';

  Future<OtpVerifiactionModel> verifyOtp(String clientId,String phone, String otp) async {
    var body = {'ClientId': clientId, 'Mobile': phone,'OTP':otp};
    Response response = await apiClient.invokeAPI(trendingpath, 'POST_', jsonEncode(body));

    return OtpVerifiactionModel.fromJson(jsonDecode(response.body));
  }
}