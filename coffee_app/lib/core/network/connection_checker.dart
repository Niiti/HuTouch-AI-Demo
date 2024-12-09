// lib/core/network/connection_checker.dart
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionChecker {
  Future<bool> get isConnected async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}