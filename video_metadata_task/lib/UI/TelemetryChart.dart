import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_metadata_task/Data/TelemetryDataModel.dart';

//Chart widget to handle the creation of the combined line chart to display xAcc, yAcc and zAcc
class TelemetryChart extends StatelessWidget{
  final List<TelemetryDataModel> data;

  TelemetryChart(List<TelemetryDataModel> data) : this.data = data;

  @override
  Widget build(BuildContext context) {
    List<Series<TelemetryDataModel, DateTime>> chartSeries = [
      new Series<TelemetryDataModel, DateTime>(
          id: 'xAcc',
          colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
          data: this.data,
          domainFn: (TelemetryDataModel point, _) => point.datetime,
          measureFn: (TelemetryDataModel point, _) => point.xAcc),
      new Series<TelemetryDataModel, DateTime>(
          id: 'yAcc',
          colorFn: (_, __) => MaterialPalette.red.shadeDefault,
          data: this.data,
          domainFn: (TelemetryDataModel point, _) => point.datetime,
          measureFn: (TelemetryDataModel point, _) => point.yAcc),
      new Series<TelemetryDataModel, DateTime>(
          id: 'zAcc',
          colorFn: (_, __) => MaterialPalette.green.shadeDefault,
          data: this.data,
          domainFn: (TelemetryDataModel point, _) => point.datetime,
          measureFn: (TelemetryDataModel point, _) => point.zAcc)];

    return new TimeSeriesChart(chartSeries);
  }

}