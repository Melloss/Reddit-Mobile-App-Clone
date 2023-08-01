import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ConnectionController extends GetxController {
  var connectedToInternet = false.obs;
  var showConnectivityStatus = true.obs;

  addconnectionListener() {
    return Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet) {
        connectedToInternet.value = true;
        Timer(const Duration(seconds: 3), () {
          showConnectivityStatus.value = false;
        });
      } else {
        showConnectivityStatus.value = true;
        connectedToInternet.value = false;
      }
    });
  }
}
