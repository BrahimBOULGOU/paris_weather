import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/weather_response.dart';

part 'weather_list_state.freezed.dart';

@freezed
class WeatherListState with _$WeatherListState {
  const factory WeatherListState(
      {final WeatherResponse? weatherResponse,
      final String? errorMessage,
      final WeatherListStatus? weatherListStatus}) = _WeatherListState;
}

enum WeatherListStatus {
  initial,
  loading,
  success,
  failed,
}
