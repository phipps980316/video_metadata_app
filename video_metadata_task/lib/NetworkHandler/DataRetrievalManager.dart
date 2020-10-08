import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:video_metadata_task/Data/DecodedDataModel.dart';

//class to hold all of the http request logic with static method so class doesn't need to be instantiated
class DataRetrievalManager{
  static Future<DecodedDataModel> fetchJSON (int page) async{
    Dio dio = new Dio(); //Dio to handle the http request
    Response response = await retry( //Retry to handle the 500 error code or any error that returns
            () => dio.get(
            "https://us-central1-mynextbase-connect.cloudfunctions.net/sampleData",
            queryParameters: {"page": page}), //specify the page parameter
        retryIf: (error) => error is DioError); //this will keep retrying provided the device has internet connectivity and the api functioning
        //As the api is stated to be fully functional just unstable, then the application will continuously retry as the data is available
        //if the api was not fully functional, then a limit on the amount of retries may be implemented to stop unnecessary attempts

    DecodedDataModel decodedDataModel = new DecodedDataModel(json.decode(response.toString())); //decode the json response to an object
    return decodedDataModel;
  }


}