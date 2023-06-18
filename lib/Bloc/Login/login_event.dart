part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class FetchLogin extends LoginEvent{
  final String userName;
  final String password;
  final String clientId;
  FetchLogin({required this.clientId,required this.password,required this.userName});
}