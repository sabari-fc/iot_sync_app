import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_sync/utils/theme/colors.dart';

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String greeting;
  const CurvedAppBar({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: AppColors.primaryColor,
      leading: const Padding(
        padding: EdgeInsets.all(8),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://media.licdn.com/dms/image/C5603AQE_VlqgGG8IUw/profile-displayphoto-shrink_800_800/0/1663047738108?e=2147483647&v=beta&t=C6_i2S_r31trcu2nHYE0FHGjHk3jkGMizORUemePbzY'),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greeting,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            'Sabarinath PS',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
