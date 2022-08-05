import 'package:wheather_api/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherService{
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = '2361521dcd66c9389d63378ce292ed79';
    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
        path: '/data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );
    http.Response response = await http.get(url);

    if(response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else{
      throw Exception('Failed to load weather information');
    }

  }
}