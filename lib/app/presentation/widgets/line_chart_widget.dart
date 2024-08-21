import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/app/data/models/historical_model.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/formatted_value.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    required this.historical,
    super.key,
  });

  final List<HistoricalModel> historical;

  @override
  Widget build(BuildContext context) {
    final filteredHistorical = historical.reversed.toList();
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 10,
        titlesData: Titles.getTitleData(filteredHistorical),
        gridData: FlGridData(
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey[800],
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color.fromARGB(255, 66, 66, 66),
            width: 2,
          ),
        ),
        lineBarsData: [
          //#TODO:simplificar sports
          LineChartBarData(
            spots: [
              FlSpot(0, filteredHistorical[10].close),
              FlSpot(1, filteredHistorical[9].close),
              FlSpot(2, filteredHistorical[8].close),
              FlSpot(3, filteredHistorical[7].close),
              FlSpot(4, filteredHistorical[6].close),
              FlSpot(5, filteredHistorical[5].close),
              FlSpot(6, filteredHistorical[4].close),
              FlSpot(7, filteredHistorical[3].close),
              FlSpot(8, filteredHistorical[2].close),
              FlSpot(9, filteredHistorical[1].close),
              FlSpot(10, filteredHistorical[0].close),
            ],
            //isCurved: true,
            color: Colors.white,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              gradient: const LinearGradient(
                colors: [
                  Colors.redAccent,
                  Colors.orangeAccent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Titles {
  static FlTitlesData getTitleData(List<HistoricalModel> historical) =>
      FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            //#TODO:simplificar
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return AppText.detail(formatDate(historical[10].date));
                case 1:
                  return AppText.detail(formatDate(historical[9].date));
                case 2:
                  return AppText.detail(formatDate(historical[8].date));
                case 3:
                  return AppText.detail(formatDate(historical[7].date));
                case 4:
                  return AppText.detail(formatDate(historical[6].date));
                case 5:
                  return AppText.detail(formatDate(historical[5].date));
                case 6:
                  return AppText.detail(formatDate(historical[4].date));
                case 7:
                  return AppText.detail(formatDate(historical[3].date));
                case 8:
                  return AppText.detail(formatDate(historical[2].date));
                case 9:
                  return AppText.detail(formatDate(historical[1].date));
                case 10:
                  return AppText.detail(formatDate(historical[0].date));
              }
              return const Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return const Text('');
            },
            reservedSize: 35,
          ),
        ),
      );
}
