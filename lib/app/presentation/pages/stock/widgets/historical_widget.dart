import 'package:flutter/material.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/data/repositories/historical_repository.dart';
import 'package:invest_app/app/presentation/widgets/line_chart_widget.dart';
import 'package:invest_app/app/utils/commom.dart';

class HistoricalWidget extends StatelessWidget {
  const HistoricalWidget({
    required this.stock,
    super.key,
  });

  final StockModel stock;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
        // ignore: discarded_futures
        future: getHistorical(HttpClient(), stock),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildLoading();
          } else if (snapshot.hasError) {
            return Container();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return buildNoData();
          } else {
            return LineChartWidget(historical: snapshot.data!);
          }
        },
      ),
    );
  }
}
