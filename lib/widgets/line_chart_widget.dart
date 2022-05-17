import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:waterbear_movement/utilities/line_titles.dart';

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LineChart(
    LineChartData(
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: LineTitles.getTitleData(),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 2),
            FlSpot(2, 3),
            FlSpot(3, 3),
            FlSpot(4, 4),
            FlSpot(5, 4),
            FlSpot(6, 4),
            FlSpot(7, 5),
          ],
          dotData: FlDotData(show: false),
          colors: [Colors.grey, Colors.grey],
          barWidth: 1,
        ),
        LineChartBarData(
          spots: [
            FlSpot(1, 9),
            FlSpot(2, 7),
            FlSpot(3, 8),
            FlSpot(4, 4),
            FlSpot(5, 2),
            FlSpot(6, 2),
            FlSpot(7, 1),
          ],
          dotData: FlDotData(show: false),
          colors: [Colors.black, Colors.black],
          barWidth: 1,
        ),
      ],
    ),
  );
}
