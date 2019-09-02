import 'dart:async';
import 'package:charts/src/touch_input/touch_input.dart';
import 'package:flutter/material.dart';
import 'base_chart_painter.dart';

/// This class holds all data needed to [BaseChartPainter],
/// in this phase just the [BorderData] provided
/// to drawing chart border line,
/// see inherited samples:
/// [LineChartData], [BarChartData], [PieChartData]
class BaseChartData {
  BorderData borderData;
  TouchData touchData;

  BaseChartData({
    this.borderData,
    this.touchData,
  }) {
    borderData ??= BorderData();
  }
}

/***** BorderData *****/
/// Border Data that contains
/// used the [Border] class to draw each side of border.
class BorderData {
  final bool show;
  Border border;

  BorderData({
    this.show = true,
    this.border,
  }) {
    border ??= Border.all(
      color: Colors.black,
      width: 1.0,
      style: BorderStyle.solid,
    );
  }
}

/***** TouchData *****/
/// holds information about touch on the chart
class TouchData {
  /// determines enable or disable the touch in the chart
  final bool enabled;

  /// determines that charts should respond to normal touch events or not
  final bool enableNormalTouch;

  /// chart notifies the touch responses through this [StreamSink]
  /// in form of a [BaseTouchResponse] class
  final StreamSink<BaseTouchResponse> touchResponseSink;

  const TouchData(this.enabled, this.touchResponseSink, this.enableNormalTouch);
}

/***** TitlesData *****/
/// we use this typedef to determine which titles
/// we should show (according to the value),
/// we pass the value and get a boolean to show the title for that value.
typedef GetTitleFunction = String Function(double value);

String defaultGetTitle(double value) {
  return '$value';
}

/// This class is responsible to hold data about showing titles.
/// titles show on the each side of chart
class TitlesData {
  final bool show;

  final SideTitles leftTitles, topTitles, rightTitles, bottomTitles;

  const TitlesData({
    this.show = true,
    this.leftTitles = const SideTitles(reservedSize: 40, showTitles: true),
    this.topTitles = const SideTitles(reservedSize: 6),
    this.rightTitles = const SideTitles(
      reservedSize: 40,
    ),
    this.bottomTitles = const SideTitles(reservedSize: 22, showTitles: true),
  });
}

/// specify each side titles data
class SideTitles {
  final bool showTitles;
  final GetTitleFunction getTitles;
  final double reservedSize;
  final TextStyle textStyle;
  final double margin;

  const SideTitles({
    this.showTitles = false,
    this.getTitles = defaultGetTitle,
    this.reservedSize = 22,
    this.textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 11,
    ),
    this.margin = 6,
  });
}

/// this class holds the touch response details,
/// specific touch details should be hold on the concrete child classes
class BaseTouchResponse {
  final TouchInput touchInput;

  BaseTouchResponse(this.touchInput);
}
