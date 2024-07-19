part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class NoAuthentication extends AuthState {}

class AuthenticationLoading extends AuthState {}

class AuthenticationSuccess extends AuthState {
  const AuthenticationSuccess(this.user);
  final User user;
  @override
  List<Object> get props => [user];
}

class AuthenticationFailed extends AuthState {
  const AuthenticationFailed(this.message);
  final Failure message;
  @override
  List<Object> get props => [message];
}
