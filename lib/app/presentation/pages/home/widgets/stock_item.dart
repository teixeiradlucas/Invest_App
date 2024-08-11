import 'package:flutter/material.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class StockItem extends StatelessWidget {
  const StockItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 20,
          height: 20,
          color: AppColors.beigeColor,
        ),
        AppText.body('BBAS3'),
        AppText.body(r'R$ 29,87'),
        AppText.body('+ 0,08%'),
        AppText.body('DY: 9%'),
      ],
    );
  }
}
