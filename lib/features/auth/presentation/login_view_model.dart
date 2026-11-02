import 'package:easy_song/features/auth/application/login_use_case.dart';
import 'package:easy_song/features/auth/domain/user.dart';
import 'package:easy_song/features/auth/presentation/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase login;

  new({required this.login}) : super(LoginInitial());

  Future<void> signIn(String email, String password) async {
    emit(LoginLoading());
    try {
      final User user = await login.execute(email, password);
      emit(LoginSucces(user: user));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
