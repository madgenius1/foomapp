import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UsageChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const UsageChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value < 0 || value >= data.length)
                    return const SizedBox();
                  return Text(
                    data[value.toInt()]['app'] as String,
                    style: const TextStyle(fontSize: 10),
                  );
                },
              ),
            ),
          ),
          barGroups: data.asMap().entries.map((entry) {
            final index = entry.key;
            final usage = entry.value['minutes'] as int;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(toY: usage.toDouble(), color: Colors.blue),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
