import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:paris_weather/core/network/apis_helper.dart';
import 'package:paris_weather/weather_list/bloc/weather_list_cubit.dart';
import 'package:paris_weather/weather_list/bloc/weather_list_state.dart';
import 'package:paris_weather/weather_list/models/weather_response.dart';
import 'package:mockito/mockito.dart';

import 'weather_list_cubit_test.mocks.dart';

@GenerateMocks([ApisHelper])
@GenerateNiceMocks([MockSpec<WeatherListCubit>()])
void main() {
  final client = MockApisHelper();
  final weatherResponse = WeatherResponse(cod: '200');

  group('WeatherListCubit tests', () {
    blocTest<WeatherListCubit, WeatherListState>(
      'emits [loading, success] when getWeatherData is called successfully',
      build: () => WeatherListCubit(client),
      act: (cubit) {
        when(client.getWeatherData('Paris,fr', 'appKey'))
            .thenAnswer((_) async => weatherResponse);

        cubit.getWeatherData(
            city: 'Paris,fr', appId: 'appKey');
      },
      expect: () => [
        const WeatherListState(weatherListStatus: WeatherListStatus.loading),
        WeatherListState(
            weatherListStatus: WeatherListStatus.success,
            weatherResponse: weatherResponse)
      ],
    );
    blocTest<WeatherListCubit, WeatherListState>(
      'emits [loading, failed] when getWeatherData throws an error',
      build: () => WeatherListCubit(client),
      act: (cubit) {
        when(client.getWeatherData('Paris,fr', 'appKey'))
            .thenThrow(Exception());
        cubit.getWeatherData(
            city: 'Paris,fr', appId: 'appKey');
      },
      expect: () => [
        const WeatherListState(weatherListStatus: WeatherListStatus.loading),
        const WeatherListState(
            weatherListStatus: WeatherListStatus.failed,
            errorMessage: 'Exception')
      ],
    );
  });
}
