import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  double min_temp;
  double max_temp;
  double temp;
  String date;
  WeatherModel(
      {required this.date,
      required this.max_temp,
      required this.min_temp,
      required this.temp,
      required this.weatherStateName});

  factory WeatherModel.fromjson(Map<String, dynamic> data) {
    return WeatherModel(
      date: data['applicable_date'],
      max_temp: data['max_temp'],
      min_temp: data['min_temp'],
      temp: data['the_temp'],
      weatherStateName: data['weather_state_name'],
    );
  }
  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }


  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder' ){
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
