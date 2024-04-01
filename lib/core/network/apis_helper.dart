import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../weather_list/models/weather_response.dart';

part 'apis_helper.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5")
abstract class ApisHelper {
  factory ApisHelper(Dio dio) = _ApisHelper;

  @GET("/forecast")
  Future<WeatherResponse> getWeatherData(
      @Query('q') String query, @Query('appid') String appid);
}
