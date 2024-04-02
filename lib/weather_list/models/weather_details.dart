import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'main.dart';
import 'weather.dart';

part 'weather_details.g.dart';

@JsonSerializable()
class WeatherData extends Equatable {
  final int dt;
  final Main main;
  final List<Weather> weather;

  const WeatherData(
      {required this.dt, required this.main, required this.weather});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);

  @override
  List<Object> get props => [dt, main, weather];

  @override
  bool get stringify => true;
}
