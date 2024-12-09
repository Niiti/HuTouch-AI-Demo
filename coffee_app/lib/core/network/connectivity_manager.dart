import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityManager {
  final Connectivity _connectivity = Connectivity();

  Future<bool> get isConnected async {
    var result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
