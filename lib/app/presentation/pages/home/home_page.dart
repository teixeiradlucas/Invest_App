// ignore_for_file: discarded_futures

import 'package:flutter/material.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/data/repositories/stock_repository.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/app_bar_widget.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/historical_stock_widget.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_dropwon.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_list.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_title.dart';

import 'package:invest_app/app/utils/commom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedTicket;
  List<StockModel>? _stocks;

  @override
  void initState() {
    super.initState();
    _selectedTicket = 'BBAS3';
    _loadStocks();
  }

  Future<void> _loadStocks() async {
    final stocks = await getStocks(HttpClient());
    setState(() {
      _stocks = stocks;
      _selectedTicket ??= stocks
          .firstWhere(
            (stock) => stock.ticket == 'BBAS3',
            orElse: () => stocks.first,
          )
          .ticket;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarWidget(),
          if (_selectedTicket != null)
            HistoricalStockWidget(ticket: _selectedTicket!),
          if (_stocks != null)
            StockDropdown(
              stocks: _stocks!,
              selectedTicket: _selectedTicket,
              onChanged: (value) {
                setState(() {
                  _selectedTicket = value;
                });
              },
            ),
          const StockTitle(),
          if (_stocks != null) StockList(stocks: _stocks!),
          if (_stocks == null) buildLoading(),
        ],
      ),
    );
  }
}
