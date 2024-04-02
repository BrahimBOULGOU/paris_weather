import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paris_weather/login/widgets/login_button.dart';

void main() {
  testWidgets('Should render Login button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: LoginButton(
      text: 'Login',
      onTap: () {},
    ))));

    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('Should call onTap when button is tapped',
      (WidgetTester tester) async {
    var tapped = false;
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: LoginButton(
      text: 'Login',
      onTap: () {
        tapped = true;
      },
    ))));

    await tester.tap(find.byType(InkWell));
    expect(tapped, true);
  });
}
