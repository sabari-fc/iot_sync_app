import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_sync/controllers/devices/device_controller.dart';
import 'package:iot_sync/controllers/greeting/greet_controller.dart';
import 'package:iot_sync/utils/theme/colors.dart';
import 'package:iot_sync/widgets/curved_appbar.dart';
import 'package:iot_sync/widgets/device_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Active Devices',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              GridView.builder(
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
              const SizedBox(
                height: 16,
              ),
              Text(
                'Frequently Used',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              GridView.builder(
                itemCount: 4,
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
            ],
          ),
        ),
      ),
    );
  }
}
