import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paris_weather/core/extensions/date_extension.dart';
import 'package:paris_weather/core/extensions/int_extension.dart';
import 'package:paris_weather/core/extensions/temp_extension.dart';
import 'package:paris_weather/weather_list/widgets/weather_item.dart';

void main() {
  testWidgets('Should render weather item', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
            body: WeatherItem(
      date: 1712005200,
      temperature: 283.37,
      description: 'broken clouds',
    ))));

    final description = find.text('broken clouds');
    expect(description, findsOneWidget);

    final temperature = find.text(283.37.toCelsius());
    expect(temperature, findsOneWidget);

    final date = find.text(1712005200.toDateTime().toTimeString());
    expect(date, findsOneWidget);
  });
}
