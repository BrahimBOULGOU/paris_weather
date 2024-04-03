import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paris_weather/core/extensions/date_extension.dart';
import 'package:paris_weather/core/extensions/int_extension.dart';

import '../../core/network/apis_helper.dart';
import '../../core/utils/status_code.dart';
import '../models/weather_details.dart';
import 'weather_list_state.dart';

class WeatherListCubit extends Cubit<WeatherListState> {
  final ApisHelper apisHelper;
  WeatherListCubit(this.apisHelper) : super(const WeatherListState());

  void getWeatherData({required String city, required String appId}) async {
    Map<String, List<WeatherData>> weatherResponseByDate = {};
    emit(state.copyWith(weatherListStatus: WeatherListStatus.loading));
    try {
      final response = await apisHelper.getWeatherData(city, appId);
  
      if (response.cod == StatusCode.success.value) {
         if (response.list != null) {
        weatherResponseByDate = response.list!
            .groupListsBy((item) => item.dt.toDateTime().toDateString());
      }
        emit(state.copyWith(
            weatherListStatus: WeatherListStatus.success,
            weatherResponseByDate: weatherResponseByDate));
      } else {
        emit(state.copyWith(weatherListStatus: WeatherListStatus.failed));
      }
    } catch (e) {
      emit(state.copyWith(
          weatherListStatus: WeatherListStatus.failed,
          errorMessage: e.toString()));
    }
  }
}
