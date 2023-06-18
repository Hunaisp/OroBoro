part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}
class OtpblocLoading extends OtpState {}
class OtpblocLoaded extends OtpState {}
class OtpblocError extends OtpState {}