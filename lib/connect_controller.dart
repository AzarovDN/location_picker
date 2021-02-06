import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class ConnectController extends GetxController {
  final isConnect = true.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  static ConnectController get to => Get.find<ConnectController>();

  @override
  void onInit() {
    // TODO: implement onInit
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        isConnect.value = true;
        break;
      case ConnectivityResult.mobile:
        isConnect.value = true;
        break;
      case ConnectivityResult.none:
        isConnect.value = false;
        break;
      default:
        break;
    }
  }

  showError() {
    Get.snackbar(
      "Ошибка.",
      'Отсутствует подключение к Интернету',
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
      backgroundColor: Colors.red,
    );
  }
}
