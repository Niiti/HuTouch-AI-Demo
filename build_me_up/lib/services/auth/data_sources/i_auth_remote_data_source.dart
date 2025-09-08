abstract class IAuthRemoteDataSource {
  Future<void> register({required String name, required String email, required String password});
}