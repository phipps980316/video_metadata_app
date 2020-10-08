//Basic object to hold the information from the api that the app will use, accessible through some getters
class TelemetryDataModel {
  double _xAcc;
  double _yAcc;
  double _zAcc;
  double _lat;
  double _lon;
  DateTime _dateTime;

  TelemetryDataModel(Map<String, dynamic> json){
    this._xAcc = json['xAcc'].toDouble();
    this._yAcc = json['yAcc'].toDouble();
    this._zAcc = json['zAcc'].toDouble();
    this._lat = json['lat'].toDouble();
    this._lon = json['lon'].toDouble();
    this._dateTime = DateTime.parse(json['datetime']);
  }

  double get xAcc => _xAcc;

  double get yAcc => _yAcc;

  double get zAcc => _zAcc;

  double get lon => _lon;

  double get lat => _lat;

  DateTime get datetime => _dateTime;
}