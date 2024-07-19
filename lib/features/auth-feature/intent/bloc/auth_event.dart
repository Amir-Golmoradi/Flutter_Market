part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.email, required this.password});

  final String email;
  final String password;
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent({required this.email, required this.password});

  final String email;
  final String password;
}
