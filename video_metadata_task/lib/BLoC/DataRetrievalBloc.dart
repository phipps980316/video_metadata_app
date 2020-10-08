import 'package:bloc/bloc.dart';
import 'package:video_metadata_task/Data/DecodedDataModel.dart';
import 'package:video_metadata_task/Events/Events.dart';
import 'package:video_metadata_task/Data/TelemetryDataModel.dart';
import 'package:video_metadata_task/States/AppState.dart';
import 'package:video_metadata_task/NetworkHandler/DataRetrievalManager.dart';

//business logic component to get data from API - Gets event from UI Buttons
class DataRetrievalBloc extends Bloc<RetrieveDataEvent, AppState> {
  DataRetrievalBloc() : super(AppState(new List(), "Get Data", false));

  Stream<AppState> mapEventToState(Event event) async* {
    if (event is RetrieveDataEvent) {
      List<TelemetryDataModel> data = new List();
      yield AppState(data, "Starting Data Retrieval...", false); //Change state to update button text so that the user is informed of the progress

      bool moreData = true; //Flag to let for loop keep running if there is more data to be fetched
      int page = 0; //Current API page number
      while (moreData) {
        String status = "Fetching Data : Page $page"; //Set the status to state which page is being processed

        DecodedDataModel decodedDataModel = await DataRetrievalManager.fetchJSON(page); //Fetch the information from the API with the specified page number

        //add each data point to the local list
        for (int i = 0; i < decodedDataModel.data.length; i++) {
          data.add(new TelemetryDataModel(decodedDataModel.data[i]));
        }
        yield AppState(data, status, false); //update the app state with the new list and status

        moreData = decodedDataModel.isMore; //if the previous data specified there is more data, then the loop is to continued
        if (moreData) page++; //if there is more data to follow, then next page  should be fetched
      }
      yield AppState(data, "Data Complete, Press To Restart", true); //update the app state so that all of the data is return, the status lets the user know that
                                                                    //the process is complete and the map is now available to view
    }
  }
}
