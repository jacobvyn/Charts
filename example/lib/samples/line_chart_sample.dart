import 'package:charts/charts.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSampleState();
}

class LineChartSampleState extends State<LineChartSample>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  List<Color> gradientColors = [
    Color(0xff3752a7),
    Color(0xff7efdff),
  ];

  List<Spot> spots = [
    Spot(0, 3),
    Spot(2.6, 2),
    Spot(4.9, 5),
    Spot(6.8, 3.1),
    Spot(8, 4),
    Spot(9.5, 3),
    Spot(10, 5),
    Spot(12, 2),
    Spot(14, 14),
    Spot(15, 5),
    Spot(16, 3),
    Spot(18.3, 10),
    Spot(20, 4)
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.only(
              right: 16.0, left: 16.0, top: 16.0, bottom: 16.0),
          child: Chart(
              chart: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    gridData: GridData(show: false),
                    titlesData: TitlesData(show: false),
                    borderData: BorderData(show: false),
                    minX: 0,
                    maxX: 20,
                    minY: 0,
                    maxY: 14,
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: false,
                        colors: gradientColors,
                        barWidth: 2.0,
                        dotData: DotData(
                            show: true,
                            dotColor: gradientColors.last,
                            dotSize: 6,
                            checkToShowDot: (spot) {
                              return spots.last == spot;
                            }),
                        belowBarData: BelowBarData(show: false),
                      ),
                    ],
                  ),
                  animation)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
