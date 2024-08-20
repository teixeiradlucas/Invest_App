import 'package:flutter/material.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/data/repositories/stock_repository.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/app_bar_widget.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_item.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_title.dart';
import 'package:invest_app/app/presentation/widgets/line_chart_widget.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: Column(
        children: [
          const AppBarWidget(),
          Container(
            color: AppColors.blackColor,
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: const LineChartWidget(),
          ),
          const StockTitle(),
          FutureBuilder<List<StockModel>>(
            // ignore: discarded_futures
            future: getStocks(HttpClient()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildLoading();
              } else if (snapshot.hasError) {
                return _buildError(snapshot.error);
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return _buildNoData();
              } else {
                return _buildList(snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildError(Object? error) {
    return Center(child: Text('Error: $error'));
  }

  Widget _buildNoData() {
    return const Center(child: Text('No stocks found'));
  }

  Widget _buildList(List<StockModel> stocks) {
    final filteredStocks = stocks
        .where(
          (stock) =>
              stock.name.isNotEmpty && stock.price != 0 && stock.volume > 0,
        )
        .toList();

    return Expanded(
      child: ListView.builder(
        itemCount: filteredStocks.length,
        itemBuilder: (context, index) {
          final stock = filteredStocks[index];
          return StockItem(
            ticket: stock.ticket,
            name: stock.name,
            price: stock.price,
            dy: stock.dividendYield,
            priceOpen: stock.priceOpen,
          );
        },
      ),
    );
  }
}
