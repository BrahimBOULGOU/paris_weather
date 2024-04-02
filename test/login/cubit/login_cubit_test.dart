import 'package:flutter_test/flutter_test.dart';
import 'package:paris_weather/login/bloc/login_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:paris_weather/login/bloc/login_state.dart';

void main() {
  blocTest<LoginCubit, LoginState>(
    'emits [loading, success] when login is called',
    build: () => LoginCubit(),
    act: (cubit) =>
        cubit.login(username: 'brahmboulgou@gmail.com', password: 'test'),
    expect: () => [
      const LoginState(loginStatus: LoginStatus.loading),
      isA<LoginState>()
          .having((s) => s.loginStatus, 'loginStatus', LoginStatus.success)
          .having((s) => s.userModel?.username, 'username',
              'brahmboulgou@gmail.com')
          .having((s) => s.userModel?.name, 'name', 'Brahim'),
    ],
  );
}
