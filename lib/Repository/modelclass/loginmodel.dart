class LoginModel {
  LoginModel({
    this.version,
    this.statusCode,
    this.message,
    this.transactionId,
    this.result,});

  LoginModel.fromJson(dynamic json) {
    version = json['Version'];
    statusCode = json['StatusCode'];
    message = json['Message'];
    transactionId = json['TransactionId'];
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  String? version;
  int? statusCode;
  String? message;
  int? transactionId;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Version'] = version;
    map['StatusCode'] = statusCode;
    map['Message'] = message;
    map['TransactionId'] = transactionId;
    if (result != null) {
      map['Result'] = result?.toJson();
    }
    return map;
  }

}

class Result {
  Result({
    this.status,
    this.userID,
    this.name,});

  Result.fromJson(dynamic json) {
    status = json['Status'];
    userID = json['UserID'];
    name = json['Name'];
  }
  String? status;
  int? userID;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['UserID'] = userID;
    map['Name'] = name;
    return map;
  }

}