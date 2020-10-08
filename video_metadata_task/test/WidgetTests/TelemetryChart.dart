import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_metadata_task/Data/TelemetryDataModel.dart';
import 'package:video_metadata_task/UI/TelemetryChart.dart';

void main() {
  testWidgets('Chart Renders', (WidgetTester tester) async {
    List<TelemetryDataModel> data = new List();

    Map<String, dynamic> map = {
      "xAcc" : 0.0390625,
      "yAcc" : -0.046875,
      "zAcc" : 0.0234375,
      "lat" : 51.57187,
      "lon" : -3.20286661783854,
      "datetime" : "2018-02-22T09:39:46Z"
    };

    data.add(new TelemetryDataModel(map));

    final chartWidget = TelemetryChart(data);

    await tester.pumpWidget(Container(child: chartWidget));

    final widgetFinder = find.byWidget(chartWidget);

    expect(widgetFinder, findsOneWidget);
  });
}