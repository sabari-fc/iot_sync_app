import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iot_sync/controllers/bottom_nav/bottom_nav_controller.dart';
import 'package:iot_sync/controllers/greeting/greet_controller.dart';
import 'package:iot_sync/utils/theme/colors.dart';
import 'package:iot_sync/views/devices/devices_view.dart';
import 'package:iot_sync/views/home/home_view.dart';
import 'package:iot_sync/views/profile/profile_view.dart';
import 'package:iot_sync/widgets/curved_appbar.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());
    return Scaffold(
      body: Obx(() => _getPage(controller.currentIndex.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          onTap: (index) {
            controller.changeTabIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/icon_home.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/icon_devices.svg'),
              label: 'Devices',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/icon_person.svg'),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const DevicesView();
      case 2:
        return const ProfileView();
      default:
        return const Text('No page found');
    }
  }
}
