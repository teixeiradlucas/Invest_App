import 'package:flutter/material.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/dimension_custom.dart';
import 'package:invest_app/app/utils/formatted_value.dart';
import 'package:invest_app/app/utils/images/app_images_stocks.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class AppBarStockWidget extends StatelessWidget {
  const AppBarStockWidget({
    required this.stock,
    super.key,
  });

  final StockModel stock;
  @override
  Widget build(BuildContext context) {
    final variation = variationAccount(stock.priceOpen, stock.price);
    return SafeArea(
      child: ColoredBox(
        color: AppColors.grayBlackColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 20),
          child: Row(
            children: [
              const BackButton(),
              gap,
              SizedBox(
                height: 60,
                width: 60,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      ticketImages[stock.ticket] ??
                          AppImagesStocks.defaultImage,
                    ),
                  ),
                ),
              ),
              gap,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.h2(
                    stock.name.length > 16
                        ? '${stock.name.substring(0, 16)}...'
                        : stock.name,
                  ),
                  Row(
                    children: [
                      AppText.h2(color: AppColors.grayColor, stock.ticket),
                      gap,
                      AppText.h2(
                        variation,
                        color: variation.contains('-')
                            ? AppColors.redColor
                            : AppColors.greenColor,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
