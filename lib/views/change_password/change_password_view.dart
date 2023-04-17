import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:iot_sync/controllers/profile/profile_controller.dart';
import 'package:iot_sync/utils/theme/colors.dart';
import 'package:iot_sync/widgets/filled_button.dart';
import 'package:iot_sync/widgets/input_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),
                  Text(
                    'Change Password!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add new password to secure your profile.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textColor.withOpacity(0.6),
                        ),
                  ),
                  const SizedBox(height: 40),
                  InputTextField(
                      hint: 'Current Password',
                      controller: controller.currentPassController),
                  const SizedBox(height: 16),
                  InputTextField(
                    hint: 'New Password',
                    controller: controller.newPassController,
                  ),
                  const SizedBox(height: 16),
                  InputTextField(
                    hint: 'Confirm Password',
                    controller: controller.confirmPassController,
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
      ),
    );
  }
}
