
import 'package:coleman/data/api/login_api.dart';
import 'package:coleman/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ILoginRepository)
class LoginRepositoryImpl implements ILoginRepository {
  final LoginApi _loginApi;

  LoginRepositoryImpl(LoginApi loginApi):
        _loginApi = loginApi;

  //TODO EITHER RESULT
  @override
  Future<bool> login(String userName, String password) async {
    return await _loginApi.login(userName, password);
  }
}
