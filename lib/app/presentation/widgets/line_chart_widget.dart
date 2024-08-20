import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 70000,
        titlesData: Titles.getTitleData(),
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
            spots: const [
              FlSpot(0, 30000),
              FlSpot(1, 10000),
              FlSpot(2, 15000),
              FlSpot(3, 30000),
              FlSpot(4, 40000),
              FlSpot(5, 35000),
              FlSpot(6, 50000),
              FlSpot(7, 30000),
              FlSpot(8, 40000),
              FlSpot(9, 45000),
              FlSpot(10, 30000),
              FlSpot(11, 35000),
            ],
            //isCurved: false,
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
  static FlTitlesData getTitleData() => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 2:
                  return const Text(
                    '2020',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  );
                case 5:
                  return const Text(
                    '2021',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  );
                case 8:
                  return const Text(
                    '2022',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  );
              }
              return const Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 10000:
                  return const Text(
                    '10k',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  );
                case 20000:
                  return const Text(
                    '20k',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  );
                case 30000:
                  return const Text(
                    '30k',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  );
                case 40000:
                  return const Text(
                    '40k',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  );
                case 50000:
                  return const Text(
                    '50k',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  );
                case 60000:
                  return const Text(
                    '60k',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  );
                case 70000:
                  return const Text(
                    '70k',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  );
              }
              return const Text('');
            },
            reservedSize: 35,
          ),
        ),
      );
}
