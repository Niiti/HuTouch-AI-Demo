abstract class IAuthRepository {
  Future<void> register({required String name, required String email, required String password});
}