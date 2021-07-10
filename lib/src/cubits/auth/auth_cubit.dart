import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:listmania/src/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  Future<void> signInWithGoogle() async {
    try {
      final userCredential = await authRepository.signInWithGoogle();

      emit(Authenticated(userCredential: userCredential));
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await authRepository.signOut();

      emit(Unauthenticated());
    } catch (e) {
      print(e);
    }
  }
}
