import 'package:flutter/material.dart';

import 'package:iot_sync/utils/theme/colors.dart';

class DeviceContainer extends StatelessWidget {
  final bool connected;
  final Function(bool)? onChanged;

  const DeviceContainer({
    super.key,
    required this.connected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEAEFFF),
            Color(0xFFFAF9FF),
          ],
          transform: GradientRotation(98.5),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.monitor,
                  size: 20,
                ),
              ),
              Switch(
                value: connected,
                onChanged: onChanged,
                thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors
                          .white; // set the thumb color to white when selected
                    }
                    return Colors
                        .white; // set the thumb color to grey when unselected
                  },
                ),
                activeColor: AppColors.primaryColor,
                trackColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppColors
                          .primaryColor; // set the thumb color to white when selected
                    }
                    return const Color.fromRGBO(68, 86, 104,
                        0.6); // set the thumb color to grey when unselected
                  },
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Device Name',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                'Connected',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF445668),
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
