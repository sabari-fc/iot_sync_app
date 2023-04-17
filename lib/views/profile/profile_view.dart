import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_sync/controllers/auth/auth_controller.dart';

import 'package:iot_sync/utils/theme/colors.dart';
import 'package:iot_sync/views/change_password/change_password_view.dart';
import 'package:iot_sync/views/edit_profile/edit_profile_view.dart';
import 'package:iot_sync/views/login/login_view.dart';
import 'package:iot_sync/views/profile/widgets/profile_menu_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColors.primaryColor,
            ),
            child: Column(
              children: [
                const SizedBox(height: 48),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/C5603AQE_VlqgGG8IUw/profile-displayphoto-shrink_800_800/0/1663047738108?e=2147483647&v=beta&t=C6_i2S_r31trcu2nHYE0FHGjHk3jkGMizORUemePbzY',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Andrey Thomson",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  "andrey.t@gmail.com",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              ProfileMenuTile(
                title: 'Edit Profile',
                icon: Icons.edit,
                onClick: () {
                  Get.to(
                    () => EditProfileView(),
                  );
                },
              ),
              ProfileMenuTile(
                title: 'Security',
                icon: Icons.lock,
                onClick: () {
                  Get.to(
                    () => ChangePasswordView(),
                  );
                },
              ),
              ProfileMenuTile(
                title: 'Logout',
                icon: Icons.logout,
                onClick: () async {
                  await authController.signOut();
                  Get.offAll(
                    () => LoginView(),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
