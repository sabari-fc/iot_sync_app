import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:iot_sync/controllers/profile/profile_controller.dart';
import 'package:iot_sync/widgets/filled_button.dart';
import 'package:iot_sync/widgets/input_field.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 48),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/C5603AQE_VlqgGG8IUw/profile-displayphoto-shrink_800_800/0/1663047738108?e=2147483647&v=beta&t=C6_i2S_r31trcu2nHYE0FHGjHk3jkGMizORUemePbzY',
                  ),
                ),
                const SizedBox(height: 32),
                InputTextField(
                  hint: 'Full Name',
                  controller: controller.nameController,
                ),
                const SizedBox(height: 16),
                InputTextField(
                  hint: 'Email',
                  controller: controller.emailController,
                ),
                const SizedBox(height: 16),
                InputTextField(
                  hint: 'Phone Number',
                  controller: controller.phoneController,
                ),
              ],
            ),
            FilledButton(
              buttonText: 'Save',
              onClick: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
