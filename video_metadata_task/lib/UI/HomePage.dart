import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_metadata_task/BLoC/DataRetrievalBloc.dart';
import 'package:video_metadata_task/States/AppState.dart';
import 'package:video_metadata_task/Events/Events.dart';
import 'package:video_metadata_task/UI/TelemetryChart.dart';

import 'MapPage.dart';

class HomePage extends StatelessWidget { //Home Page Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Metadata Home")),
      body: BlocBuilder<DataRetrievalBloc, AppState>( //Bloc builder to update the widget when the app state changes
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                flex: 6,
                child: TelemetryChart(state.data),
              ),
              Expanded(
                  flex: 1,
                  child: Row(children: [
                    Expanded(
                      child: RaisedButton(
                        onPressed: () => //When button is pressed, fire an RetrieveDataEvent
                            BlocProvider.of<DataRetrievalBloc>(context)
                                .add(new RetrieveDataEvent()),
                        child: Text(state.status),
                      ),
                    ),
                  ])),
              Expanded(
                  flex: 1,
                  child: Row(children: [
                    Expanded(
                      //If state.mapAvailable is true then enable the button to take the user to the map activity
                      //otherwise render a disabled button with a message prompting the user to download the data
                      child: state.mapAvailable
                          ? RaisedButton(
                              onPressed: () => navigateToMapPage(context),
                              child: Text("View Map"))
                          : RaisedButton(
                              onPressed: () => {},
                              child: Text("Data Must Be Loaded For Map"),
                            ),
                    )
                  ]))
            ],
          );
        },
      ),
    );
  }

  //Function to take the user to the map activity with the same context so that the bloc will be available
  Future navigateToMapPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
  }
}
