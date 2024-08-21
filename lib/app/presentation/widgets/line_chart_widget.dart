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
          LineChartBarData(
            spots: List.generate(
              11,
              (index) => FlSpot(
                index.toDouble(),
                filteredHistorical[10 - index].close,
              ),
            ),
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
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              if (index >= 0 && index <= 10) {
                return AppText.detail(formatDate(historical[10 - index].date));
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
