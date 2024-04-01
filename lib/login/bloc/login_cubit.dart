import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paris_weather/login/bloc/login_state.dart';

import '../models/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void login({required String username, required String password}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      final userModel =
          UserModel(username: 'brahmboulgou@gmail.com', name: 'Brahim');
      emit(state.copyWith(
          loginStatus: LoginStatus.success, userModel: userModel));
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.failed));
    }
  }
}