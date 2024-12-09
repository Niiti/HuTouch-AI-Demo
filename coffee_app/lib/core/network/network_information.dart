import 'connectivity_manager.dart';

class NetworkInformation {
  final ConnectivityManager connectivityManager;

  NetworkInformation(this.connectivityManager);

  Future<bool> get isConnected => connectivityManager.isConnected;
}
