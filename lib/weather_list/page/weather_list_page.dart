import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/apis_helper.dart';
import '../bloc/weather_list_cubit.dart';
import '../bloc/weather_list_state.dart';
import '../models/weather_details.dart';
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
        ..getWeatherData(city: 'Paris,fr', appId: appId),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Center(
                child: Text('Bienvenue $name',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)))),
        body: BlocBuilder<WeatherListCubit, WeatherListState>(
            builder: (context, state) {
          if (state.weatherListStatus == WeatherListStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              itemCount: state.weatherResponseByDate?.keys.length ?? 0,
              itemBuilder: (context, index) {
                final date = state.weatherResponseByDate?.keys.elementAt(index);
                final weatherData = state.weatherResponseByDate?[date]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      date ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildWeatherListDetails(weatherData),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildWeatherListDetails(List<WeatherData>? weatherData) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: weatherData?.length ?? 0,
        itemBuilder: (context, index) {
          return WeatherItem(
            date: weatherData?[index].dt,
            temperature: weatherData?[index].main.temp,
            icon: weatherData?[index].weather[0].icon,
            description: weatherData?[index].weather[0].description,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16),
      ),
    );
  }
}
