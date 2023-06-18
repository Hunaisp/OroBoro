part of 'token_bloc.dart';

@immutable
abstract class TokenState {}

class TokenInitial extends TokenState {}
class TokenblocLoading extends TokenState {}
class TokenblocLoaded extends TokenState {}
class TokenblocError extends TokenState {}