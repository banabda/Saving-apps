import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MonthChart extends StatelessWidget {
  const MonthChart({
    Key key,
    @required this.yValues,
  }) : super(key: key);

  final List<double> yValues;

  @override
  Widget build(BuildContext context) {
    return LineChart(
        // swapAnimationDuration: Duration(milliseconds: 150),
        LineChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(show: false),
            minY: yValues.reduce(min) * 0.1,
            maxY: yValues.reduce(max) * 1.1,
            lineBarsData: [
          LineChartBarData(
            spots: yValues.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value);
            }).toList(),
            isCurved: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              colors: [
                kBiruColor.withOpacity(0.7),
                kBackgroundColor
              ],
              gradientColorStops: [0, 1.0],
              gradientFrom: const Offset(0, 0),
              gradientTo: const Offset(0, 1),
            ),
            colors: [kBiruColor],
            barWidth: 2,
          )
        ]));
  }
}