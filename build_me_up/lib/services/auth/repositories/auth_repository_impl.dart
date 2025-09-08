import 'package:build_me_up/services/auth/data_sources/i_auth_remote_data_source.dart';
import 'package:build_me_up/services/auth/repositories/i_auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl(this._remote);
  final IAuthRemoteDataSource _remote;

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) {
    return _remote.register(name: name, email: email, password: password);
  }
}
