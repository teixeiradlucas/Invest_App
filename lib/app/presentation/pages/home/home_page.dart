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

  @override
  void initState() {
    super.initState();
    _selectedTicket = 'BBAS3';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarWidget(),
          HistoricalStockWidget(ticket: _selectedTicket!),
          FutureBuilder<List<StockModel>>(
            future: getStocks(HttpClient()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildLoading();
              } else if (snapshot.hasError) {
                return buildError(snapshot.error);
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return buildNoData();
              } else {
                return StockDropdown(
                  stocks: snapshot.data!,
                  selectedTicket: _selectedTicket,
                  onChanged: (value) {
                    setState(() {
                      _selectedTicket = value;
                    });
                  },
                );
              }
            },
          ),
          const StockTitle(),
          FutureBuilder<List<StockModel>>(
            future: getStocks(HttpClient()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildLoading();
              } else if (snapshot.hasError) {
                return buildError(snapshot.error);
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return buildNoData();
              } else {
                return StockList(stocks: snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }
}
