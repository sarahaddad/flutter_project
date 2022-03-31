 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
   WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context){
              return SearchPage();
            }));
          },
            icon: Icon(Icons.search,
          size: 30,),),
        ],
      ),
      body: Provider.of<WeatherProvider> (context,listen: true).weatherData == null
          ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ):Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3,),
                Text( Provider.of<WeatherProvider>(context).cityName!,
                style: TextStyle(fontSize: 32,
                fontWeight: FontWeight.bold),),
                Text(weatherData!.date.toString(),
                  style: TextStyle(fontSize: 28,),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    Image.asset(weatherData!.getImage()),
                    Text( weatherData!.temp.toInt().toString(),
                      style: TextStyle(fontSize: 32,
                          fontWeight: FontWeight.bold),),
                    Column(
                      children: [
                        Text('maxTemp :${weatherData!.max_temp.toInt()}'),
                        Text('minTemp : ${weatherData!.min_temp.toInt()}'),
                      ],
                    ),


                  ],
                ),
                Spacer(),
                Text(weatherData!.weatherStateName,
                  style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.bold),),
                Spacer(flex: 5,)
              ],
      ),
          )
    );
  }
}
