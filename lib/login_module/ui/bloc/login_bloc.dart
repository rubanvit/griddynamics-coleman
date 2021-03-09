import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coleman/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

import 'login_event.dart';
import 'login_state.dart';

@singleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginRepository _loginRepository;

  LoginBloc(ILoginRepository loginRepository)
      : _loginRepository = loginRepository,
        super(const LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield* event.when(pressed: (username, password) async* {
      yield const LoginState.processing();
      final loginResult = await _loginRepository.login(username, password);
      yield loginResult ? const LoginState.success() : const LoginState.error();
      yield const LoginState.initial();
    });
  }
}
