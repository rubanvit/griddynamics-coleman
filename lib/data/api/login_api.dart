import 'package:injectable/injectable.dart';

@singleton
class LoginApi {
  Future<bool> login(String userName, String password) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    if (userName == '123' && password == '123') {
      return true;
    } else
      return false;
  }
}
