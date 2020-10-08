import 'package:flutter_test/flutter_test.dart';
import 'package:video_metadata_task/Data/DecodedDataModel.dart';
import 'package:video_metadata_task/Data/TelemetryDataModel.dart';
import 'package:video_metadata_task/NetworkHandler/DataRetrievalManager.dart';

void main(){
  group('Data Retrieval Manager Tests', () {
    test('Data should be fetched from the API Page 0', () async {
      DecodedDataModel decodedDatamodel = await DataRetrievalManager.fetchJSON(0);

      expect(decodedDatamodel.data.isEmpty, false);
    });
    test('Data should be accessible through getters', () async {
      DecodedDataModel decodedDataModel = await DataRetrievalManager.fetchJSON(0);

      expect(decodedDataModel.data.isEmpty, false);
      expect(decodedDataModel.isMore, true);

      TelemetryDataModel telemetryDataModel = new TelemetryDataModel(decodedDataModel.data[0]);

      expect(telemetryDataModel.xAcc.isNaN, false);
      expect(telemetryDataModel.yAcc.isNaN, false);
      expect(telemetryDataModel.zAcc.isNaN, false);
      expect(telemetryDataModel.lat.isNaN, false);
      expect(telemetryDataModel.lon.isNaN, false);
    });
  });
}