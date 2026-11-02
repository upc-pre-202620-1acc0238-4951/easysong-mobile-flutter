import 'package:easy_song/features/auth/domain/user.dart';

sealed class LoginState {
  const new();
}

class LoginInitial extends LoginState {
  const new();
}

class LoginLoading extends LoginState {
  const new();
}

class LoginSucces extends LoginState {
  final User user;
  const new({required this.user});
}

class LoginFailure extends LoginState {
  final String message;
  const new({required this.message});
}