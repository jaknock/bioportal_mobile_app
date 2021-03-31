import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PopulationData {
  int year;
  int population;
  charts.Color barColor;
  PopulationData(
      {@required this.year,
      @required this.population,
      @required this.barColor});
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Bar Chart Example'),
      centerTitle: true,
    ),
    body: Center(
      child: Container(
        height: 400,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: charts.BarChart(
                    _getSeriesData(),
                    animate: true,
                    domainAxis: charts.OrdinalAxisSpec(
                        renderSpec:
                            charts.SmallTickRendererSpec(labelRotation: 60)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

final List<PopulationData> data = [
  PopulationData(
      year: 1880,
      population: 50189209,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)),
];

_getSeriesData() {
  List<charts.Series<PopulationData, String>> series = [
    charts.Series(
        id: "Population",
        data: data,
        domainFn: (PopulationData series, _) => series.year.toString(),
        measureFn: (PopulationData series, _) => series.population,
        colorFn: (PopulationData series, _) => series.barColor)
  ];
  return series;
}
