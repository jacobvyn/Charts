import 'package:example/samples/bar_chart_sample.dart';
import 'package:flutter/material.dart';

class BarChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff20386c),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: BarChartSample(),
        ),
      ),
    );
  }
}
