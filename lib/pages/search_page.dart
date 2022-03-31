import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? city_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: (Text('Search a City')),
),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20 ),
          child: TextField(
            onSubmitted: (data) async {
              city_name=data;
              WeatherServices service=WeatherServices();
           WeatherModel weather  = await service.getWeather(cityName :city_name!);
           Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName = city_name;


           //weather provider diye bir class oluşturdum içinde weather modelinden bir object oluşurdum,kullancidan gelen data provider objisine atanır.


           Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: GestureDetector(

                  onTap : (  ) async
                  {
                    WeatherServices service = WeatherServices();

                    WeatherModel? weather = await service.getWeather(cityName:city_name!);

                    Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                    Provider.of<WeatherProvider>(context,listen: false).cityName = city_name;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
