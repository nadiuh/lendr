import 'package:flutter_test/flutter_test.dart';
import 'package:lendr_new/main.dart';
import 'package:lendr_new/screens/home_screen.dart';

void main() {
  testWidgets('App smoke test renders HomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that HomeScreen is displayed.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
