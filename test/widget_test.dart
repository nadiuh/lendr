import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lendr_new/main.dart';
import 'package:lendr_new/screens/login_screen.dart';
import 'package:lendr_new/screens/splash_screen.dart';

void main() {
  testWidgets('App smoke test renders SplashScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(SplashScreen), findsOneWidget);
  });

  testWidgets('LoginScreen renders all required authentication UI components', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    expect(find.text('Welcome back!'), findsOneWidget);
    expect(find.text('Log in to continue to Lender.'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot password?'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);
  });
}
