part of 'token_bloc.dart';

@immutable
abstract class TokenEvent {}
class FetchToken extends TokenEvent{
  final String userName;
  final String passwordInBase64;

  FetchToken({required this.passwordInBase64,required this.userName});
}