import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_api/states/weather_state.dart';
import '../model/weather_model.dart';
import '../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());

  Future<void> fetchWeather(String cityName) async {
    WeatherService weatherService = WeatherService();
    emit(WeatherLoading());

    try {
      WeatherModel weatherModel =
          await weatherService.fetchWeatherInformation(cityName);
      emit(
        WeatherLoaded(weatherModel: (weatherModel),),);

    } catch(e) {
      emit(WeatherError(errorMessage: e.toString()));
      }
  }
}