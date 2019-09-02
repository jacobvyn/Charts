library charts;

import 'package:flutter/material.dart';

import 'src/chart/bar_chart/bar_chart.dart';
import 'src/chart/base/base_chart/base_chart.dart';
import 'src/chart/base/base_chart/base_chart_painter.dart';
import 'src/chart/line_chart/line_chart.dart';
import 'src/chart/pie_chart/pie_chart.dart';
import 'src/touch_input/touch_input.dart';

export 'src/chart/bar_chart/bar_chart.dart';
export 'src/chart/bar_chart/bar_chart_data.dart';
export 'src/chart/base/axis_chart/axis_chart_data.dart';
export 'src/chart/base/base_chart/base_chart_data.dart';
export 'src/chart/line_chart/line_chart.dart';
export 'src/chart/line_chart/line_chart_data.dart';
export 'src/chart/pie_chart/pie_chart.dart';
export 'src/chart/pie_chart/pie_chart_data.dart';

/// A base widget that holds a [BaseChart] class
/// that contains [BaseChartPainter] extends from [CustomPainter]
/// to paint the relative content on our [CustomPaint] class
/// [BaseChart] is an abstract class and we should use a concrete class
/// such as [LineChart], [BarChart], [PieChart].
class Chart extends StatefulWidget {
  final BaseChart chart;

  Chart({
    Key key,
    @required this.chart,
  }) : super(key: key) {
    if (chart == null) {
      throw Exception('chart should not be null');
    }
  }

  @override
  State<StatefulWidget> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  ///We will notify Touch Events through this Notifier in form of a [TouchInput],
  ///then the painter returns touched details through a StreamSink
  TouchInputNotifier _touchInputNotifier;

  @override
  void initState() {
    super.initState();
    _touchInputNotifier = TouchInputNotifier(null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _touchInputNotifier.value = LongPressStart(details.localPosition);
      },
      onLongPressEnd: (details) {
        _touchInputNotifier.value = LongPressEnd(details.localPosition);
      },
      onLongPressMoveUpdate: (details) {
        _touchInputNotifier.value = LongPressMoveUpdate(details.localPosition);
      },
      onPanCancel: () {
        _touchInputNotifier.value = PanEnd(Offset.zero);
      },
      onPanEnd: (DragEndDetails details) {
        _touchInputNotifier.value = PanEnd(Offset.zero);
      },
      onPanDown: (DragDownDetails details) {
        _touchInputNotifier.value = PanStart(details.localPosition);
      },
      onPanUpdate: (DragUpdateDetails details) {
        _touchInputNotifier.value = PanMoveUpdate(details.localPosition);
      },
      child: CustomPaint(
        painter: widget.chart.painter(
          touchInputNotifier: _touchInputNotifier,
          touchResponseSink: widget.chart.getData().touchData.touchResponseSink,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _touchInputNotifier.dispose();
  }
}
