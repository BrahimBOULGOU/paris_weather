import 'package:json_annotation/json_annotation.dart';

import 'main.dart';
import 'weather.dart';

part 'weather_details.g.dart';

@JsonSerializable()
class WeatherData {
  int? dt;
  Main? main;
  List<Weather>? weather;

  WeatherData({this.main, this.weather, this.dt});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
