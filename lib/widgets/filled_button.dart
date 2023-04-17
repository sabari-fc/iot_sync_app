import 'package:flutter/material.dart';
import 'package:iot_sync/utils/theme/colors.dart';

class FilledButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;

  const FilledButton({Key? key, required this.buttonText, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick,
      color: AppColors.primaryColor,
      minWidth: double.maxFinite,
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
