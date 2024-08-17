import 'package:flutter/material.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/data/repositories/stock_repository.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/app_bar_widget.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_item.dart';
import 'package:invest_app/app/utils/dimension_custom.dart';
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
            color: AppColors.whiteColor,
            width: 500,
            height: 200,
          ),
          gap,
          const StockItem(),
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
        .where((stock) => stock.name.isNotEmpty && stock.value != 0)
        .toList();

    return Expanded(
      child: ListView.builder(
        itemCount: filteredStocks.length,
        itemBuilder: (context, index) {
          final stock = filteredStocks[index];
          return ListTile(
            leading: const Icon(Icons.trending_up),
            title: Text(stock.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Value: ${stock.value}'),
                Text('Dividend Yield: ${stock.dividendYield}%'),
                Text('Sector: ${stock.sector}'),
              ],
            ),
            trailing: Text(stock.ticket),
          );
        },
      ),
    );
  }
}
