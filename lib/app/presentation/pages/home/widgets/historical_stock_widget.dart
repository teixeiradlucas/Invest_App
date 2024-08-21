// ignore_for_file: discarded_futures

import 'package:flutter/material.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/data/repositories/stock_repository.dart';
import 'package:invest_app/app/presentation/pages/stock/widgets/historical_widget.dart';
import 'package:invest_app/app/utils/commom.dart';

class HistoricalStockWidget extends StatelessWidget {
  const HistoricalStockWidget({
    required this.ticket,
    super.key,
  });
  final String ticket;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StockModel?>(
      future: _getStock(ticket, HttpClient()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoading();
        } else if (snapshot.hasError) {
          return buildError(snapshot.error);
        } else if (!snapshot.hasData) {
          return buildNoData();
        } else {
          return HistoricalWidget(stock: snapshot.data!);
        }
      },
    );
  }
}

Future<StockModel?> _getStock(String ticket, HttpClient client) async {
  final stocks = await getStocks(client);
  return stocks.firstWhere(
    (stock) => stock.ticket == ticket,
  );
}
