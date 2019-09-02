import 'dart:async';

import 'package:charts/charts.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class PieChartSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartSampleState();
}

class PieChartSampleState extends State<PieChartSample>
    with SingleTickerProviderStateMixin {
  List<PieChartSectionData> pieChartRawSections;
  List<PieChartSectionData> showingSections;

  StreamController<PieTouchResponse> pieTouchedResultStreamController;

  AnimationController controller;

  int touchedIndex;

  @override
  void initState() {
    super.initState();

    final section1 = PieChartSectionData(
      color: Color(0xff0293ee).withOpacity(0.8),
      value: 25,
      title: "",
      radius: 80,
      titleStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff044d7c)),
      titlePositionPercentageOffset: 0.55,
    );

    final section2 = PieChartSectionData(
      color: Color(0xfff8b250).withOpacity(0.8),
      value: 25,
      title: "",
      radius: 65,
      titleStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff90672d)),
      titlePositionPercentageOffset: 0.55,
    );

    final section3 = PieChartSectionData(
      color: Color(0xff845bef).withOpacity(0.8),
      value: 25,
      title: "",
      radius: 60,
      titleStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff4c3788)),
      titlePositionPercentageOffset: 0.6,
    );

    final section4 = PieChartSectionData(
      color: Color(0xff13d38e).withOpacity(0.8),
      value: 25,
      title: "",
      radius: 70,
      titleStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff0c7f55)),
      titlePositionPercentageOffset: 0.55,
    );

    final items = [
      section1,
      section2,
      section3,
      section4,
    ];

    pieChartRawSections = items;

    showingSections = pieChartRawSections;

    pieTouchedResultStreamController = StreamController();
    pieTouchedResultStreamController.stream.distinct().listen((details) {
      if (details == null) {
        return;
      }

      touchedIndex = -1;
      if (details.sectionData != null) {
        touchedIndex = showingSections.indexOf(details.sectionData);
      }

      setState(() {});
    });
    controller = new AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: "One",
                  isSquare: false,
                  size: touchedIndex == 0 ? 18 : 16,
                  textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: "Two",
                  isSquare: false,
                  size: touchedIndex == 1 ? 18 : 16,
                  textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: "Three",
                  isSquare: false,
                  size: touchedIndex == 2 ? 18 : 16,
                  textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: "Four",
                  isSquare: false,
                  size: touchedIndex == 3 ? 18 : 16,
                  textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Chart(
                  chart: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(
                            touchResponseStreamSink:
                                pieTouchedResultStreamController.sink,
                          ),
                          startDegreeOffset: 180,
                          borderData: BorderData(
                            show: false,
                          ),
                          sectionsSpace: 12,
                          centerSpaceRadius: 0,
                          sections: showingSections),
                      controller.view),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pieTouchedResultStreamController.close();
  }
}
