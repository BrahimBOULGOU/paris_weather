import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paris_weather/core/network/apis_helper.dart';
import 'package:paris_weather/weather_list/bloc/weather_list_cubit.dart';
import 'package:paris_weather/weather_list/models/main.dart';
import 'package:paris_weather/weather_list/models/weather.dart';
import 'package:paris_weather/weather_list/models/weather_details.dart';
import 'package:paris_weather/weather_list/models/weather_response.dart';
import 'package:paris_weather/weather_list/page/weather_list_page.dart';
import 'package:flutter/material.dart';

class FakeApisHelper implements ApisHelper {
  @override
  Future<WeatherResponse> getWeatherData(String city, String appId) async {
    return WeatherResponse(
      list: [
        WeatherData(
          dt: 1633024800,
          main: Main(temp: 20.0),
          weather: [Weather(description: 'clear sky', icon: '01d')],
        ),
      ],
    );
  }
}

void main() {
  testWidgets('Test WeatherListPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherListCubit>.value(
          value: WeatherListCubit()..getWeatherData(city: 'Paris,fr', appId: 'fd5695f360a8712d1538592c3333b9ac',
              apisHelper: FakeApisHelper()),
          child: const WeatherListPage(name: 'Test'),
        ),
      ),
    );

    await tester.pumpAndSettle();
  });
}