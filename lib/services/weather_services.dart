import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherServices {
  String baseurl = 'https://www.metaweather.com';

  Future<int> getCity_id({required String cityName}) async {
    Uri url = Uri.parse('$baseurl/api/location/search/?query=$cityName');
    http.Response response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);
    int city_id = data[0]['woeid'];

    return city_id;
  }

  Future<WeatherModel> getWeather({required String cityName}) async {
    int id = await getCity_id(cityName: cityName);
    Uri url = Uri.parse('$baseurl/api/location/$id/');
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    Map<String, dynamic> data = jsonData['consolidated_weather'][0];
    WeatherModel weatherData = WeatherModel.fromjson(data);
    return weatherData;
  }
}
