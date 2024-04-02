import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/apis_helper.dart';
import '../bloc/weather_list_cubit.dart';
import '../bloc/weather_list_state.dart';
import '../widgets/weather_item.dart';

class WeatherListPage extends StatelessWidget {
  final String? name;
  const WeatherListPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    String appId =
        'fd5695f360a8712d1538592c3333b9ac'; //todo: move to dart define (config files)

    return BlocProvider(
      create: (context) => WeatherListCubit(ApisHelper(Dio()))
        ..getWeatherData(
            city: 'Paris,fr', appId: appId),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Text(name ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500))),
        body: BlocBuilder<WeatherListCubit, WeatherListState>(
            builder: (context, state) {
          if (state.weatherListStatus == WeatherListStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: state.weatherResponse?.list?.length ?? 0,
            itemBuilder: (context, index) {
              return WeatherItem(
                date: state.weatherResponse?.list?[index].dt,
                temperature: state.weatherResponse?.list?[index].main?.temp,
                icon: state.weatherResponse?.list?[index].weather?[0].icon,
                description:
                    state.weatherResponse?.list?[index].weather?[0].description,
              );
            },
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
            ),
          );
        }),
      ),
    );
  }
}
