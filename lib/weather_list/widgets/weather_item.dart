import 'package:flutter/material.dart';
import 'package:paris_weather/core/extensions/int_extension.dart';
import 'package:paris_weather/core/extensions/temp_extension.dart';
import 'package:paris_weather/core/extensions/date_extension.dart';

class WeatherItem extends StatelessWidget {
  final int? date;
  final String? icon;
  final double? temperature;
  final String? description;
  const WeatherItem(
      {super.key, this.icon, this.temperature, this.description, this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Image.network('https://openweathermap.org/img/wn/$icon@2x.png'),
        ],
        Column(
          children: [
            Text(date?.toDateTime().toDateString() ?? ''),
            Text(temperature?.toCelsius() ?? ''),
            Text(description ?? ''),
          ],
        )
      ],
    );
  }
}
