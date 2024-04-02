import 'package:flutter/material.dart';
import 'package:paris_weather/core/extensions/date_extension.dart';
import 'package:paris_weather/core/extensions/int_extension.dart';
import 'package:paris_weather/core/extensions/temp_extension.dart';
import 'package:paris_weather/weather_list/widgets/weather_icon.dart';

class WeatherItem extends StatelessWidget {
  final int? date;
  final String? icon;
  final double? temperature;
  final String? description;
  const WeatherItem(
      {super.key, this.icon, this.temperature, this.description, this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (icon != null) ...[WeatherIcon(icon: icon!)],
            Text(date?.toDateTime().toTimeString() ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            Text(temperature?.toCelsius() ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            Text(description ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16))
          ],
        ),
      ),
    );
  }
}
