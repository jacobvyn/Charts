import 'dart:async';

import 'package:charts/src/chart/base/axis_chart/axis_chart.dart';
import 'package:charts/src/chart/base/base_chart/base_chart_data.dart';
import 'package:charts/src/chart/base/base_chart/base_chart_painter.dart';
import 'package:charts/src/touch_input/touch_input.dart';
import 'package:flutter/animation.dart';

import 'line_chart_data.dart';
import 'line_chart_painter.dart';

class LineChart extends AxisChart {
  final LineChartData lineChartData;
  final Animation<double> animation;

  LineChart(this.lineChartData, this.animation);

  @override
  BaseChartPainter painter(
      {TouchInputNotifier touchInputNotifier,
      StreamSink<BaseTouchResponse> touchResponseSink}) {
    return LineChartPainter(
        lineChartData, animation, touchInputNotifier, touchResponseSink);
  }

  @override
  BaseChartData getData() => lineChartData;
}
