import 'package:flutter/material.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/strings/app_strings.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class StockTitle extends StatelessWidget {
  const StockTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: AppColors.grayBlackColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 50,
            ),
            AppText.body(AppStrings.ticket),
            AppText.body(AppStrings.value),
            AppText.body(AppStrings.variation),
            AppText.body(AppStrings.dy),
          ],
        ),
      ),
    );
  }
}
