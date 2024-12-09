import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  Future<bool> get isConnected async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}