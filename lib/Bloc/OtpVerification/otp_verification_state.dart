part of 'otp_verification_bloc.dart';

@immutable
abstract class OtpVerificationState {}

class OtpVerificationInitial extends OtpVerificationState {}
class OtpVerificationblocLoading extends OtpVerificationState {}
class OtpVerificationblocLoaded extends OtpVerificationState {}
class OtpVerificationblocError extends OtpVerificationState {}