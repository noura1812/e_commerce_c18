part of 'auth_cubit.dart';

sealed class AuthState {}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserEntity userEntity;

  LoginSuccessState({required this.userEntity});
}

class LoginFailureState extends AuthState {
  final Failure failure;

  LoginFailureState({required this.failure});
}

class SignupLoadingState extends AuthState {}

class SignupSuccessState extends AuthState {
  final UserEntity userEntity;

  SignupSuccessState({required this.userEntity});
}

class SignupFailureState extends AuthState {
  final Failure failure;

  SignupFailureState({required this.failure});
}
