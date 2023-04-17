import 'package:get/get.dart';

class DevicesController extends GetxController {
  RxBool isConnected = false.obs;

  void toggleSwitch(value) => isConnected.value = value;
}
