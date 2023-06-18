part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}
class FetchOtp extends OtpEvent{
  final String phone;
  final String clientId;
  FetchOtp({required this.phone,required this.clientId});
}