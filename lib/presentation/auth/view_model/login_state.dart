part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginDisplay extends LoginState {
  final String userName;

  LoginDisplay(this.userName);
}

class LoginError extends LoginState {
  final String title;

  LoginError(this.title);
}

class LoginOut extends LoginState {}
