import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState  with _$LoginState  {
  const factory LoginState.initial() = LoginStateInitial;
  const factory LoginState.processing() = LoginStateProcessing;
  const factory LoginState.error() = LoginStateError;
  const factory LoginState.success() = LoginStateSuccess;
}