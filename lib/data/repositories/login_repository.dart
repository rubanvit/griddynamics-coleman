
import 'package:coleman/data/api/login_api.dart';
import 'package:coleman/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ILoginRepository)
@dev
class LoginRepositoryImpl implements ILoginRepository {
  final LoginApi loginApi = LoginApi();
  //TODO EITHER RESULT
  @override
  Future<bool> login(String userName, String password) async {
    return await loginApi.login(userName, password);
  }
}
