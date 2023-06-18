part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginblocLoading extends LoginState {}
class LoginblocLoaded extends LoginState {}
class LoginblocError extends LoginState {}