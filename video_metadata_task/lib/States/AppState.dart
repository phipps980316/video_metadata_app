import 'package:video_metadata_task/Data/TelemetryDataModel.dart';

//class to represent the state of the app, this is used as the application's state has more than one attribute
class AppState {
  List<TelemetryDataModel> data;
  String status;
  bool mapAvailable;

  AppState(List<TelemetryDataModel> data, String status, bool mapAvailable){
    this.data = data;
    this.status = status;
    this.mapAvailable = mapAvailable;
  }

}