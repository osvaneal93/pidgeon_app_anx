part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AppState {}

class AuthSignedOut extends AppState {}

class AuthSigningIn extends AppState {}

class AuthError extends AppState {
  final String message;
  const AuthError(this.message);
  @override
  List<Object> get props => [];
}

class AuthSignedIn extends AppState {
  final User user;

  const AuthSignedIn({required this.user});

  @override
  List<Object> get props => [user];
}
