import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String icon;
  const WeatherIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    try {
      return Image.network('https://openweathermap.org/img/wn/$icon@2x.png');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return const SizedBox.shrink();
    }
  }
}
