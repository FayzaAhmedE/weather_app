
abstract class WeatherStates {}

class InitWeatherState extends WeatherStates {}

class LoadingWeatherState extends WeatherStates {}

class SuccessWeatherState extends WeatherStates {
  // WeatherModel weatherModel;
  // SuccessWeatherState(this.weatherModel);
}

class FailedWeatherState extends WeatherStates {
  final String errMsg;

  new({required this.errMsg});
}
