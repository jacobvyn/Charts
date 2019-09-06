import 'dart:async';

import 'package:charts/charts.dart';
import 'package:flutter/material.dart';

class PieChartSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State with SingleTickerProviderStateMixin {
  List<PieChartSectionData> pieChartRawSections;
  List<PieChartSectionData> showingSections;

  StreamController<PieTouchResponse> pieTouchedResultStreamController;

  AnimationController controller;

  int touchedIndex;

  @override
  void initState() {
    super.initState();

    pieChartRawSections = getItems();

    showingSections = pieChartRawSections;

    pieTouchedResultStreamController = StreamController();
    pieTouchedResultStreamController.stream.distinct().listen((details) {
      if (details == null) return;

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
      aspectRatio: 1,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Chart(
                chart: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(
                            touchResponseStreamSink:
                                pieTouchedResultStreamController.sink),
                        borderData: BorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 110,
                        sections: showingSections),
                    controller.view),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> getItems() {
    var radius = 40.0;
    var titleStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF));

    var showTitle = false;

    final section1 = PieChartSectionData(
      color: Color(0xff0293ee),
      value: 40,
      title: "40%",
      radius: radius,
      showTitle: showTitle,
      titleStyle: titleStyle,
    );

    final section2 = PieChartSectionData(
      color: Color(0xfff8b250),
      value: 30,
      title: "30%",
      radius: radius,
      titleStyle: titleStyle,
      showTitle: showTitle,
    );

    final section3 = PieChartSectionData(
      color: Color(0xff845bef),
      value: 15,
      title: "15%",
      radius: radius,
      titleStyle: titleStyle,
      showTitle: showTitle,
    );

    final section4 = PieChartSectionData(
      color: Color(0xff13d38e),
      value: 15,
      title: "15%",
      radius: radius,
      titleStyle: titleStyle,
      showTitle: showTitle,
    );

    final items = [
      section1,
      section2,
      section3,
      section4,
    ];
    return items;
  }

  @override
  void dispose() {
    super.dispose();
    pieTouchedResultStreamController.close();
  }
}
