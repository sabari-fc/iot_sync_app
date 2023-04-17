import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:iot_sync/controllers/devices/device_controller.dart';
import 'package:iot_sync/controllers/greeting/greet_controller.dart';
import 'package:iot_sync/widgets/curved_appbar.dart';
import 'package:iot_sync/widgets/device_container.dart';

class DevicesView extends StatelessWidget {
  const DevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DevicesController());
    final greetController = Get.put(GreetingController());

    return Scaffold(
      appBar: CurvedAppBar(
        greeting: greetController.greeting,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: GridView.builder(
            itemCount: 3,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => Obx(
              () => DeviceContainer(
                connected: controller.isConnected.value,
                onChanged: controller.toggleSwitch,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
