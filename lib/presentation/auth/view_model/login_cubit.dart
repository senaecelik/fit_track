import 'package:fit_track/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with _CubitProperties {
  LoginCubit() : super(LoginInitial());

  final _authRepository = AuthRepository();

  Future<void> signIn(String email, String password) async {
    emit(LoginLoading());
    await _authRepository
        .loginWithEmail(email: email, password: password)
        .then((value) {
      emit(LoginSuccess());
    }).catchError(
      (error, stackTrace) {
        emit(LoginError(error.toString()));
      },
    );
  }

  Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    emit(LoginLoading());
    await _authRepository
        .signUpWithEmail(username: name, email: email, password: password)
        .then((value) {
      emit(LoginSuccess());
    }).catchError(
      (error, stackTrace) {
        emit(LoginError(error.toString()));
      },
    );
  }

  Future<void> getUserName() async {
    await _authRepository.getUserInformation().then((value) {
      userName = value.name!;
      emit(LoginDisplay(userName));
    }).onError(
      (error, stackTrace) {
        emit(LoginError(error.toString()));
      },
    );
  }

  Future<void> logout() async {
    await _authRepository.signOut();
  }
}

mixin _CubitProperties {
  String userName = "";
}
