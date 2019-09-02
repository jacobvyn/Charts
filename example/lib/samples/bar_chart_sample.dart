import 'package:charts/charts.dart';
import 'package:flutter/material.dart';

class BarChartSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSampleState();
}

class BarChartSampleState extends State<BarChartSample>
    with SingleTickerProviderStateMixin {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = Colors.transparent;
  final double maxValue = 10;
  final double width = 22;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(2020, 5);
    final barGroup2 = makeGroupData(2021, -3);
    final barGroup3 = makeGroupData(2022, 5);
    final barGroup4 = makeGroupData(2023, 7.5);
    final barGroup5 = makeGroupData(2024, 9);
    final barGroup6 = makeGroupData(2025, 11.5);
    final barGroup7 = makeGroupData(2026, 6.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;

    controller = new AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Chart(
            chart: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: TitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                        showTitles: true,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        margin: 16,
                        getTitles: (double value) {
                          return value.toString();
                        }),
                    leftTitles: SideTitles(
                        showTitles: true,
                        getTitles: (double value) {
                          return "${value.truncate()} %";
                        }),
                  ),
                  borderData: BorderData(show: false),
                  barGroups: showingBarGroups,
                ),
                controller.view)));
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: y,
        color: barColor,
        width: width,
        isRound: true,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          y: maxValue,
          color: barBackgroundColor,
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
