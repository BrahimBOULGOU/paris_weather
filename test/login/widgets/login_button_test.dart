import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paris_weather/login/widgets/login_button.dart';

void main() {
  testWidgets('Should render Se connecter button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: LoginButton(
      text: 'Se connecter',
      onTap: () {},
      isEnabled: true,
    ))));

    expect(find.text('Se connecter'), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('Should call onTap when button is tapped',
      (WidgetTester tester) async {
    var tapped = false;
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: LoginButton(
      text: 'Se connecter',
      onTap: () {
        tapped = true;
      },
      isEnabled: true,
    ))));

    await tester.tap(find.byType(InkWell));
    expect(tapped, true);
  });
}
