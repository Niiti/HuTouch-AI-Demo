import 'dart:async';
import 'package:build_me_up/core/constants/app_durations.dart';
import 'package:build_me_up/services/auth/data_sources/i_auth_remote_data_source.dart';
import 'package:build_me_up/utils/error/app_exception.dart';

class AuthRemoteDataSourceImpl implements IAuthRemoteDataSource {
  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(AppDurations.networkSimulated);
    if (email.toLowerCase().contains('error')) {
      throw NetworkException('Email not allowed');
    }
  }
}
