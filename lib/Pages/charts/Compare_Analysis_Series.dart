import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class CompareSeries {
  final String analysisyear;
  final int analysisid;
  final int analysisvalues;
  final charts.Color barcolor;
  CompareSeries({
    @required this.analysisyear,
    @required this.analysisid,
    @required this.analysisvalues,
    @required this.barcolor,
  });
}
