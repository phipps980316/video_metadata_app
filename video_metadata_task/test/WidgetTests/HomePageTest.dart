import 'package:flutter_test/flutter_test.dart';
import 'package:video_metadata_task/UI/VideoMetaDataApp.dart';

void main() {
  testWidgets('Home Page Renders With Title', (WidgetTester tester) async {
    await tester.pumpWidget(VideoMetaDataApp());

    final titleFinder = find.text('Video Metadata Home');

    expect(titleFinder, findsOneWidget);
  });
}