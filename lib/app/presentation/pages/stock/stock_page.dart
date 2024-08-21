import 'package:flutter/material.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/presentation/pages/stock/widgets/app_bar_stock_widget.dart';
import 'package:invest_app/app/presentation/pages/stock/widgets/dividend_widget.dart';
import 'package:invest_app/app/presentation/pages/stock/widgets/historical_widget.dart';
import 'package:invest_app/app/presentation/pages/stock/widgets/rectangle_widget.dart';
import 'package:invest_app/app/utils/dimension_custom.dart';
import 'package:invest_app/app/utils/formatted_value.dart';
import 'package:invest_app/app/utils/strings/app_strings.dart';

class StockPage extends StatelessWidget {
  const StockPage({
    required this.stock,
    super.key,
  });

  final StockModel stock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarStockWidget(stock: stock),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RectangleWidget(
                type: AppStrings.value,
                value: formattedPrice(stock.price),
              ),
              gap,
              RectangleWidget(
                type: AppStrings.dy,
                value: formattedPercentage(stock.dividendYield),
              ),
            ],
          ),
          gap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RectangleWidget(
                type: AppStrings.high12m,
                value: formattedPrice(stock.lastYearHigh),
              ),
              gap,
              RectangleWidget(
                type: AppStrings.low12m,
                value: formattedPrice(stock.lastYearLow),
              ),
            ],
          ),
          HistoricalWidget(stock: stock),
          DividendWidget(stock: stock),
        ],
      ),
    );
  }
}
