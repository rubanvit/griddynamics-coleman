import 'package:injectable/injectable.dart';

@singleton
class LoginApi {
  Future<bool> login(String userName, String password) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (userName == 'abc' && password == '123') {
      return true;
    } else
      return false;
  }
}
