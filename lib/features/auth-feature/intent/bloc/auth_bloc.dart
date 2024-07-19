import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dunimarket/core/database/firebase/firebase_auth_service.dart';
import 'package:flutter_dunimarket/core/error/exception.dart';
import 'package:flutter_dunimarket/core/error/failure_message.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._firebaseAuth) : super(NoAuthentication()) {
    on<AuthEvent>((event, emit) async {
      emit(NoAuthentication());

      if (event is SignUpEvent) {
        emit(AuthenticationLoading());
        try {
          await _firebaseAuth.createNewUser(event.email, event.password);
          emit(AuthenticationSuccess(_firebaseAuth.currentUser!));
        } on ServerException catch (e) {
          Failure(e.toString());
        }
      }

      if (event is LoginEvent) {
        emit(AuthenticationLoading());

        try {
          await _firebaseAuth.loginWithEmailAndPassword(
            event.email,
            event.password,
          );
          emit(AuthenticationSuccess(_firebaseAuth.currentUser!));
        } on ServerException catch (e) {
          Failure(e.toString());
        }

        //     FirebaseAuth.instance
        //         .signInWithEmailAndPassword(
        //           email: event.email,
        //           password: event.password,
        //         )
        //         .then((value) => emit(AutenticationSuccess(value.user!)))
        //         .catchError((error) {
        //       emit(AuthenticationFailed(Failure(error.toString())));
        //     });
      }
    });
  }
  final FirebaseAuthService _firebaseAuth;
}
