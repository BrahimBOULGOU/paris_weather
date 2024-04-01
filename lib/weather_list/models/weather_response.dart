import 'package:json_annotation/json_annotation.dart';

import 'city.dart';
import 'weather_details.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherData>? list;
  City? city;

  WeatherResponse({this.cod, this.message, this.cnt, this.list, this.city});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
