import '../models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {final UserModel? userModel,
      final String? errorMessage,
      final LoginStatus? loginStatus}) = _LoginState;
}

enum LoginStatus {
  initial,
  loading,
  success,
  failed,
}
