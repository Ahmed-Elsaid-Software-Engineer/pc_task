import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityStatus {
  static Future<bool> checkConnectionInternet() async {
    final result = await (Connectivity().checkConnectivity());

    var connectivityResult;

    if (result is List) {
      connectivityResult = result[0];
    } else {
      connectivityResult = result;
    }
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // I am connected to a ethernet network.
      return true;
    } else if (connectivityResult == ConnectivityResult.vpn) {
      // I am connected to a vpn network.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
      return true;
    } else if (connectivityResult == ConnectivityResult.other) {
      // I am connected to a network which is not in the above mentioned networks.
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      // I am not connected to any network.
      return false;
    }
    return false;
  }

  //
  // Future<bool> checkBlutConnectionInternet() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //    else if (connectivityResult == ConnectivityResult.bluetooth) {
  //     // I am connected to a bluetooth.
  //   }
  // }

  static Future<bool> checkInternetBySearchAboutWebsite(
      {bool checkInternet = true}) async {
    if (checkInternet == true) {
      try {
        var result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      } on SocketException {
        return false;
      }
    } else {
      return true;
    }
  }
}
