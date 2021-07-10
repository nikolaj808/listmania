part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final UserCredential userCredential;

  const Authenticated({required this.userCredential});

  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthState {}
