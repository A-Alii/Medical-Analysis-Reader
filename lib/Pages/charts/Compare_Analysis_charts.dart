import 'package:flutter/material.dart';
import 'package:medical/pages/charts/Compare_Analysis_Series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'compare_charts.dart';

class CompareAnalysisCharts extends StatelessWidget {
  final List<CompareSeries> data = [
    CompareSeries(
      analysisvalues: 80,
      barcolor: charts.ColorUtil.fromDartColor(Colors.green),
      analysisyear: "2018",
      analysisid: 58944,
    ),
    CompareSeries(
      analysisvalues: 70,
      barcolor: charts.ColorUtil.fromDartColor(Colors.grey),
      analysisyear: "2017",
      analysisid: 58939,
    ),
    CompareSeries(
      analysisvalues: 60,
      barcolor: charts.ColorUtil.fromDartColor(Colors.pink),
      analysisyear: "2019",
      analysisid: 59932,
    ),
    CompareSeries(
      analysisvalues: 95,
      barcolor: charts.ColorUtil.fromDartColor(Colors.red),
      analysisyear: "2020",
      analysisid: 68932,
    ),
    CompareSeries(
      analysisvalues: 100,
      barcolor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
      analysisyear: "2021",
      analysisid: 78932,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CompareChart(
          data:data,
        )
      ),
    );
  }
}
