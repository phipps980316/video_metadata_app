//Basic object to hold the information from the api accessible through some getters
class DecodedDataModel {
  List<dynamic> _data;
  bool _isMore;

  DecodedDataModel(Map<String, dynamic> json){
    this._data = json['data'];
    this._isMore = json['hasMore'];
  }

  bool get isMore => _isMore;

  List<dynamic> get data => _data;
}