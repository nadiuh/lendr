import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lendr_new/main.dart';
import 'package:lendr_new/screens/borrow_details_screen.dart';
import 'package:lendr_new/screens/home_screen.dart';
import 'package:lendr_new/screens/item_details_screen.dart';
import 'package:lendr_new/screens/my_bookings_screen.dart';
import 'package:lendr_new/screens/select_duration_screen.dart';

void main() {
  testWidgets('App smoke test renders HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Featured Nearby'), findsOneWidget);
  });

  testWidgets('ItemScreen renders product details and duration button', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: ItemScreen(),
      ),
    );

    expect(find.text('Canon DSLR Camera'), findsOneWidget);
    expect(find.text('Select Duration'), findsOneWidget);
    expect(find.text('About this item'), findsOneWidget);
  });

  testWidgets('SelectDurationScreen renders duration options', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SelectDurationScreen(),
      ),
    );

    expect(find.text('How long do you need this item?'), findsOneWidget);
    expect(find.text('1 Day'), findsOneWidget);
    expect(find.text('3 Days'), findsOneWidget);
    expect(find.text('7 Days'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('BorrowDetailsScreen renders item details and pricing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BorrowDetailsScreen(
          selectedDuration: 3,
          dailyPrice: 550,
        ),
      ),
    );

    expect(find.text('Borrow Details'), findsOneWidget);
    expect(find.text('Canon DSLR Camera'), findsOneWidget);
    expect(find.text('3 day(s)'), findsOneWidget);
    expect(find.text('৳550'), findsOneWidget);
    expect(find.text('Send Borrow Request'), findsOneWidget);
  });

  testWidgets('MyBookingsScreen renders booking info', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MyBookingsScreen(),
      ),
    );

    expect(find.text('My Bookings'), findsOneWidget);
    expect(find.text('Your Booking'), findsOneWidget);
    expect(find.text('Canon DSLR Camera'), findsOneWidget);
    expect(find.text('Request Sent'), findsOneWidget);
  });

  testWidgets('Tapping Requests tab navigates to MyBookingsScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap on Requests bottom nav item (2nd item, index 1)
    await tester.tap(find.byIcon(Icons.list));
    await tester.pumpAndSettle();

    expect(find.byType(MyBookingsScreen), findsOneWidget);
    expect(find.text('My Bookings'), findsOneWidget);
  });

  testWidgets('Tapping item card navigates to ItemScreen', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    // Tap on the first item card (Camera)
    await tester.tap(find.text('Camera'));
    await tester.pumpAndSettle();

    expect(find.byType(ItemScreen), findsOneWidget);
  });
}

