import 'package:flutter/material.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/dimension_custom.dart';
import 'package:invest_app/app/utils/images/app_images.dart';
import 'package:invest_app/app/utils/strings/app_strings.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          gap,
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AppImages.profileImg),
          ),
          gap,
          AppText.h2(
            '${AppStrings.hello} ${AppStrings.name}',
          ),
          const Spacer(),
          DrawerButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}
