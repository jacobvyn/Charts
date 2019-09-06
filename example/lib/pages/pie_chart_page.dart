import 'package:example/samples/pie_chart_sample.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatelessWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = Color(0xff20386c);
  final double width = 22;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff20386c),
      child: PieChartSample()
    );
  }
}
