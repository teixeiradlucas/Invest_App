import 'package:flutter/material.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/presentation/pages/stock/widgets/app_bar_stock_widget.dart';
import 'package:invest_app/app/presentation/pages/stock/widgets/historical_widget.dart';

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
          HistoricalWidget(stock: stock),
        ],
      ),
    );
  }
}
