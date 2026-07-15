import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../domain/entities/transaction_entity.dart';

/// Line chart for income/expense trends.
class ExpenseLineChart extends StatelessWidget {
  const ExpenseLineChart({
    super.key,
    required this.data,
    this.showIncome = true,
    this.showExpense = true,
    this.height = 200,
  });

  final List<ChartPoint> data;
  final bool showIncome;
  final bool showExpense;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeExtension.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    if (data.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            'No data available',
            style: TextStyle(color: colorScheme.outline),
          ),
        ),
      );
    }

    final maxY = data
        .map((p) => [p.income, p.expense].reduce((a, b) => a > b ? a : b))
        .reduce((a, b) => a > b ? a : b)
        .toDouble();

    return SizedBox(
      height: height,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: maxY > 0 ? maxY / 4 : 1,
            getDrawingHorizontalLine: (value) => FlLine(
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: data.length > 7 ? (data.length / 4).ceilToDouble() : 1,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= data.length) {
                    return const SizedBox.shrink();
                  }
                  final label = data[index].label.split(' ').first;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 10,
                        color: colorScheme.outline,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minY: 0,
          maxY: maxY > 0 ? maxY * 1.2 : 100,
          lineBarsData: [
            if (showIncome)
              LineChartBarData(
                spots: [
                  for (var i = 0; i < data.length; i++)
                    FlSpot(i.toDouble(), data[i].income.toDouble()),
                ],
                isCurved: true,
                color: theme.incomeColor,
                barWidth: 3,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: theme.incomeColor.withValues(alpha: 0.1),
                ),
              ),
            if (showExpense)
              LineChartBarData(
                spots: [
                  for (var i = 0; i < data.length; i++)
                    FlSpot(i.toDouble(), data[i].expense.toDouble()),
                ],
                isCurved: true,
                color: theme.expenseColor,
                barWidth: 3,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: theme.expenseColor.withValues(alpha: 0.1),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Pie chart for category breakdown.
class CategoryPieChart extends StatelessWidget {
  const CategoryPieChart({
    super.key,
    required this.data,
    this.height = 220,
  });

  final Map<String, int> data;
  final double height;

  static const _colors = [
    Color(0xFF1B6B4A),
    Color(0xFF2E7D32),
    Color(0xFF1565C0),
    Color(0xFFC62828),
    Color(0xFFF57C00),
    Color(0xFF6A1B9A),
    Color(0xFF00838F),
    Color(0xFFAD1457),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (data.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            'No category data',
            style: TextStyle(color: colorScheme.outline),
          ),
        ),
      );
    }

    final entries = data.entries.toList();
    final total = entries.fold<int>(0, (sum, e) => sum + e.value);

    return SizedBox(
      height: height,
      child: PieChart(
        PieChartData(
          sectionsSpace: 2,
          centerSpaceRadius: 40,
          sections: [
            for (var i = 0; i < entries.length; i++)
              PieChartSectionData(
                value: entries[i].value.toDouble(),
                title: '${(entries[i].value / total * 100).toStringAsFixed(0)}%',
                color: _colors[i % _colors.length],
                radius: 60,
                titleStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
