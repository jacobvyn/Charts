import 'dart:async';
import 'package:charts/src/chart/base/axis_chart/axis_chart.dart';
import 'package:charts/src/chart/base/base_chart/base_chart_data.dart';
import 'package:charts/src/chart/base/base_chart/base_chart_painter.dart';
import 'package:charts/src/touch_input/touch_input.dart';
import 'package:flutter/animation.dart';

import 'bar_chart_data.dart';
import 'bar_chart_painter.dart';

class BarChart extends AxisChart {
  final BarChartData barChartData;
  final Animation<double> animation;

  BarChart(this.barChartData, this.animation);

  @override
  BaseChartPainter painter(
      {TouchInputNotifier touchInputNotifier, StreamSink touchResponseSink}) {
    return BarChartPainter(
        barChartData, animation, touchInputNotifier, touchResponseSink);
  }

  @override
  BaseChartData getData() => barChartData;
}
