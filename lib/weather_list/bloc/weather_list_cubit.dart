import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/apis_helper.dart';
import 'weather_list_state.dart';

class WeatherListCubit extends Cubit<WeatherListState> {
  WeatherListCubit() : super(const WeatherListState());

  void getWeatherData(
      {required String city,
      required String appId,
      required ApisHelper apisHelper}) async {
    emit(state.copyWith(weatherListStatus: WeatherListStatus.loading));
    try {
      final response = await apisHelper.getWeatherData(city, appId);
      //todo: use enum for status codes
      if (response.cod == '200') {
        emit(state.copyWith(
            weatherListStatus: WeatherListStatus.success,
            weatherResponse: response));
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
