import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/cubit_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit({required this.weatherServices}) : super(InitWeatherState());
  WeatherServices weatherServices;
  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    emit(LoadingWeatherState());
    try {
      weatherModel = await weatherServices.getCurrentWeather(cityName: cityName);
      emit(SuccessWeatherState());
    } on Exception catch (e) {
      emit(FailedWeatherState(errMsg: e.toString()));
    }
  }
}
