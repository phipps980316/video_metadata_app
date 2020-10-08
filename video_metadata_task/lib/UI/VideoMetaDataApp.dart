import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_metadata_task/BLoC/DataRetrievalBloc.dart';

import 'HomePage.dart';

//Main app entry point that provides a DataRetrievalBloc so that its available to all child widgets
class VideoMetaDataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataRetrievalBloc>(
        create: (context) => DataRetrievalBloc(),
        child: MaterialApp(
          home: HomePage(),
      ),
    );
  }
}