import 'package:flutter_test/flutter_test.dart';
import 'package:lendr_new/main.dart';
import 'package:lendr_new/screens/splash_screen.dart';

void main() {
  testWidgets('App smoke test renders SplashScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that SplashScreen is displayed.
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
