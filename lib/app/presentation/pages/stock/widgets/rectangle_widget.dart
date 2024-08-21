import 'package:flutter/material.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/dimension_custom.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class RectangleWidget extends StatelessWidget {
  const RectangleWidget({
    required this.type,
    required this.value,
    super.key,
  });

  final String type;
  final String value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2.4,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            child: Center(
              child: AppText.h2(
                type,
                color: AppColors.blackColor,
              ),
            ),
          ),
          gap,
          Center(child: AppText.h2(value)),
        ],
      ),
    );
  }
}
