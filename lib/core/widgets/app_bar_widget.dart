import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza_ecommerce_app/core/constants/app_assets.dart';
import 'package:laza_ecommerce_app/core/helper/navigation_extensions.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: SvgPicture.asset(AppIcons.backArrow),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
