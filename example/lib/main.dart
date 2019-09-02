import 'package:flutter/material.dart';

import 'pages/bar_chart_page.dart';
import 'pages/line_chart_page.dart';
import 'pages/pie_chart_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff20386c),
        primaryColorDark: Color(0xff20386c),
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Charts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[LineChartPage(), BarChartPage(), PieChartPage()],
      ),
    );
  }
}
