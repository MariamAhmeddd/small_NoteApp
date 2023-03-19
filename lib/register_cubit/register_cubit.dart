import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/register_cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() :super(RegisterInitialState());

  Future<void> Register({required String email, required String password}) async
  {
    try {
      UserCredential user =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFail(message: 'the passpword is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFail(
            message: 'The account already exists, please enter another email'));
      }
    }
  }
}