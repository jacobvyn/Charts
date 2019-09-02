import 'dart:async';
import 'package:charts/src/chart/base/base_chart/base_chart.dart';
import 'package:charts/src/chart/base/base_chart/base_chart_data.dart';
import 'package:charts/src/chart/base/base_chart/base_chart_painter.dart';
import 'package:charts/src/touch_input/touch_input.dart';
import 'package:flutter/animation.dart';
import 'pie_chart_data.dart';
import 'pie_chart_painter.dart';

class PieChart extends BaseChart {
  final PieChartData pieChartData;
  final Animation<double> animation;

  PieChart(this.pieChartData, this.animation);

  @override
  BaseChartPainter painter(
      {TouchInputNotifier touchInputNotifier,
      StreamSink<BaseTouchResponse> touchResponseSink}) {
    return PieChartPainter(
        pieChartData, animation, touchInputNotifier, touchResponseSink);
  }

  @override
  BaseChartData getData() => pieChartData;
}
