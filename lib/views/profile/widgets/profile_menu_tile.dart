import 'package:flutter/material.dart';
import 'package:iot_sync/utils/theme/colors.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onClick;
  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            Color(0xFFEAEFFF),
            Color(0xFFFAF9FF),
          ],
        ),
      ),
      child: ListTile(
        onTap: onClick,
        leading: Icon(
          icon,
          color: AppColors.primaryColor,
        ),
        title: Text(title),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
