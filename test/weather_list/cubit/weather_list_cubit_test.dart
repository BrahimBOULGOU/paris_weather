import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:paris_weather/core/network/apis_helper.dart';
import 'package:paris_weather/weather_list/bloc/weather_list_cubit.dart';
import 'package:paris_weather/weather_list/bloc/weather_list_state.dart';
import 'package:paris_weather/weather_list/models/main.dart';
import 'package:paris_weather/weather_list/models/weather.dart';
import 'package:paris_weather/weather_list/models/weather_details.dart';
import 'package:paris_weather/weather_list/models/weather_response.dart';
import 'package:mockito/mockito.dart';

import 'weather_list_cubit_test.mocks.dart';

@GenerateMocks([ApisHelper])
@GenerateNiceMocks([MockSpec<WeatherListCubit>()])
void main() {
  final client = MockApisHelper();

  final weatherResponse = WeatherResponse(cod: '200', list: [
    const WeatherData(
      dt: 1712080800,
      main: Main(temp: 20.0),
      weather: [
        Weather(description: 'clear sky', icon: '01d', id: 1, main: ''),
      ],
    )
  ]);

  final Map<String, List<WeatherData>> weatherResponseByDate = {
    'Apr 02, 2024': [
      const WeatherData(
        dt: 1712080800,
        main: Main(temp: 20.0),
        weather: [
          Weather(description: 'clear sky', icon: '01d', id: 1, main: '')
        ],
      ),
    ],
  };

  group('WeatherListCubit tests', () {
    blocTest<WeatherListCubit, WeatherListState>(
      'emits [loading, success] when getWeatherData returns a successful response',
      build: () => WeatherListCubit(client),
      act: (cubit) {
        when(client.getWeatherData('Paris,fr', 'appKey'))
            .thenAnswer((_) async => weatherResponse);
        cubit.getWeatherData(city: 'Paris,fr', appId: 'appKey');
      },
      expect: () => [
        const WeatherListState(weatherListStatus: WeatherListStatus.loading),
        WeatherListState(
          weatherListStatus: WeatherListStatus.success,
          weatherResponseByDate: weatherResponseByDate,
        ),
      ],
    );
    blocTest<WeatherListCubit, WeatherListState>(
      'emits [loading, failed] when getWeatherData throws an error',
      build: () => WeatherListCubit(client),
      act: (cubit) {
        when(client.getWeatherData('Paris,fr', 'appKey'))
            .thenThrow(Exception());
        cubit.getWeatherData(city: 'Paris,fr', appId: 'appKey');
      },
      expect: () => [
        const WeatherListState(weatherListStatus: WeatherListStatus.loading),
        const WeatherListState(
            weatherListStatus: WeatherListStatus.failed,
            errorMessage: 'Exception')
      ],
    );

    blocTest<WeatherListCubit, WeatherListState>(
      'emits [loading, failed] when getWeatherData returns a response with non-200 status code',
      build: () => WeatherListCubit(client),
      act: (cubit) {
        final response = WeatherResponse(cod: '404', list: []);
        when(client.getWeatherData('Paris,fr', 'appKey'))
            .thenAnswer((_) async => response);
        cubit.getWeatherData(city: 'Paris,fr', appId: 'appKey');
      },
      expect: () => [
        const WeatherListState(weatherListStatus: WeatherListStatus.loading),
        const WeatherListState(weatherListStatus: WeatherListStatus.failed),
      ],
    );
  });
}
