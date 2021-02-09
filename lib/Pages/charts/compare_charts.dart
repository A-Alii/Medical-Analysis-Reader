
import 'package:medical/pages/charts/Compare_Analysis_charts.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:medical/pages/charts/Compare_Analysis_Series.dart';

class CompareChart extends StatelessWidget {
  final List<CompareSeries> data;
  CompareChart({@required this.data});
  @override
  Widget build(BuildContext context) {

    List<charts.Series<CompareSeries, String>> series
    =[
      charts.Series(
        id: "analysisvalues",
        data: data,
        domainFn:(CompareSeries series, _) =>series.analysisyear,
        measureFn: (CompareSeries series, _) =>series.analysisvalues,
        colorFn: (CompareSeries series, _) =>series.barcolor
        )
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:<Widget> [
              Text(
                "Your Analysis Result charts",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Expanded(
                child: charts.BarChart(series,animate: true)
                )
            ],
          ),
        ),
      ),

    );
  }
}

//charts.BarChart(series,animate: true);