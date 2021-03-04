abstract class ILoginRepository {
  Future<bool> login(String username, String password);
}
