import 'package:flutter_test/flutter_test.dart';
import 'package:video_metadata_task/BLoC/DataRetrievalBloc.dart';
import 'package:video_metadata_task/Events/Events.dart';

void main(){
  group('Data Retrieval Bloc Tests', () {
    test('Data should be fetched from the API', () async {
      DataRetrievalBloc dataRetrievalBloc = new DataRetrievalBloc();
      dataRetrievalBloc.add(new RetrieveDataEvent());

      await Future.delayed(const Duration(minutes: 1), (){});

      expect(dataRetrievalBloc.state.data.isEmpty, false);
    });
  });
}