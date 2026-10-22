import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  final String apiKey = '03bbad486b884660a3b123500261310';
  final String baseUrl = 'http://api.weatherapi.com/v1/';

  WeatherServices();

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response res = await dio.get(
        '${baseUrl}forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(res.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMsg =
          e.response?.data['error']['message'] ??
          'There was an error. Try later!';
      throw Exception(errMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('There was an error. Try later!');
    }
  }
}
