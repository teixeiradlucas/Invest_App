import 'package:flutter/material.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/data/repositories/stock_repository.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/app_bar_widget.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_item.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_title.dart';
import 'package:invest_app/app/utils/commom.dart';
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
            //#TODO:Procurar um widget para ocupar espaço
          ),
          const StockTitle(),
          FutureBuilder<List<StockModel>>(
            // ignore: discarded_futures
            future: getStocks(HttpClient()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildLoading();
              } else if (snapshot.hasError) {
                return buildError(snapshot.error);
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return buildNoData();
              } else {
                return _buildList(snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<StockModel> stocks) {
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
