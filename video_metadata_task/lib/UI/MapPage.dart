import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:video_metadata_task/BLoC/DataRetrievalBloc.dart';
import 'package:video_metadata_task/Data/TelemetryDataModel.dart';

import '../States/AppState.dart';

class MapPage extends StatelessWidget { //Map Page Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Metadata Map")),
      body: Center(
        child: BlocBuilder<DataRetrievalBloc, AppState>( //Bloc builder to update the widget when the app state changes
          builder: (context, state) {
            return GoogleMap(
              initialCameraPosition: getCenterOfRoute(state.data), //Position the camera to the center of the route
              polylines: getPoints(state.data), //Display the route
            );
          },
        ),
      ),
    );
  }

  //Function converts the longitude and latitude to LatLng objects to be used with the map widget
  //then creates a route to be displayed
  Set<Polyline> getPoints(List<TelemetryDataModel> data) {
    List<LatLng> mapPoints = new List();
    Map<PolylineId, Polyline> mapPolylines = {};

    for (int i = 0; i < data.length; i++) {
      mapPoints.add(new LatLng(data[i].lat, data[i].lon));
    }

    PolylineId polylineId = new PolylineId('route');
    Polyline polyline = Polyline(
        polylineId: polylineId,
        color: Colors.lightBlue,
        width: 5,
        points: mapPoints
    );

    mapPolylines[polylineId] = polyline;

    return Set<Polyline>.of(mapPolylines.values);
  }

  //Function finds the midpoint of the route and creates a camera position so that the map will be centered on the route
  CameraPosition getCenterOfRoute(List<TelemetryDataModel> data){
    double minLat = data.first.lat;
    double minLon = data.first.lon;
    double maxLat = data.first.lat;
    double maxLon = data.first.lon;

    for(int i = 0; i < data.length; i++){
      if(data[i].lat < minLat) minLat = data[i].lat;
      if(data[i].lat > maxLat) maxLat = data[i].lat;

      if(data[i].lon < minLon) minLon = data[i].lon;
      if(data[i].lon > maxLon) maxLon = data[i].lon;
    }

    double centerLat = (minLat + maxLat)/2;
    double centerLon = (minLon + maxLon)/2;
    return new CameraPosition(target: new LatLng(centerLat, centerLon), zoom:15);
  }
}
