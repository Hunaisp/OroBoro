part of 'otp_verification_bloc.dart';

@immutable
abstract class OtpVerificationEvent {}
class FetchOtpVerification extends OtpVerificationEvent{
  final String phone;
  final String otp;
  final String clientId;
  FetchOtpVerification({required this.otp,required this.phone,required this.clientId});
}