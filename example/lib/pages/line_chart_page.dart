import 'package:example/samples/line_chart_sample.dart';
import 'package:flutter/material.dart';

class LineChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff20386c),
      child: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 36.0,
                top: 24,
              ),
              child: Text(
                "Line Chart",
                style: TextStyle(
                    color: Color(
                      0xff6f6f97,
                    ),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
              right: 28,
            ),
            child: LineChartSample(),
          )
        ],
      ),
    );
  }
}
