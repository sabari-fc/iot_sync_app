import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iot_sync/controllers/auth/auth_controller.dart';
import 'package:iot_sync/utils/theme/colors.dart';
import 'package:iot_sync/views/bottom_navigation/bottom_navigation_view.dart';
import 'package:iot_sync/views/home/home_view.dart';
import 'package:iot_sync/widgets/filled_button.dart';
import 'package:iot_sync/widgets/input_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/iot_sync_logo.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'IOT Sync',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                  )
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Log in to your IOT sync account",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textColor.withOpacity(0.6),
                    ),
              ),
              const SizedBox(
                height: 48,
              ),
              Form(
                key: authController.formKey,
                child: Column(
                  children: [
                    InputTextField(
                      controller: authController.emailController,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      validator: authController.emailValidator,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputTextField(
                      controller: authController.passwordController,
                      hint: 'Password',
                      isPassword: true,
                      validator: authController.passwordValidator,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    FilledButton(
                      buttonText: 'LOGIN',
                      onClick: () async {
                        if (authController.formKey.currentState!.validate()) {
                          debugPrint('Validated');
                          try {
                            UserCredential? userCredential =
                                await authController.signInWithEmailAndPassword(
                              authController.emailController.text,
                              authController.passwordController.text,
                            );
                            if (userCredential != null) {
                              // User is signed in
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BottomNavigationView(),
                                ),
                              );
                            } else {
                              // Authentication failed
                            }
                          } catch (e) {
                            debugPrint(e.toString());
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
