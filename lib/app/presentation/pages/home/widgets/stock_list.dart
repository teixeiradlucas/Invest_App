import 'package:flutter/material.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_item.dart';

class StockList extends StatelessWidget {
  const StockList({
    required this.stocks,
    super.key,
  });
  final List<StockModel> stocks;

  @override
  Widget build(BuildContext context) {
    final filteredStocks = stocks
        .where(
          (stock) =>
              stock.name.isNotEmpty && stock.price != 0 && stock.volume > 10000,
        )
        .toList();

    return Expanded(
      child: ListView.builder(
        itemCount: filteredStocks.length,
        itemBuilder: (context, index) {
          final stock = filteredStocks[index];
          return StockItem(
            stock: stock,
          );
        },
      ),
    );
  }
}
