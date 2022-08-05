import 'package:flutter/material.dart';
import '../model/weather_model.dart';
import 'package:flutter/src/painting/box_fit.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 350,
      height: 400,
      child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),),
       elevation: 15,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40,),
          Text('${weatherModel.name}', style:
          TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Roboto mono'),),
          SizedBox(height: 30,),
          Image.network('http://openweathermap.org/img/w/${weatherModel.weather.first.icon}.png',
          width: 130, height: 130, fit: BoxFit.cover),
          // color: Colors.yellow,
          // size: 100),
        const SizedBox(height: 10,),
          Text('${weatherModel.main.temp} °C', style: TextStyle(fontSize: 40),),
        const SizedBox(height: 10,),
        Text('${weatherModel.weather.first.description}', style: TextStyle(fontSize: 25),),

        ],
    ),

      ),);
  }
}
