import 'package:flutter/material.dart';
import 'package:weather_app/helper/app_assets.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key, required this.weatherModel});

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // 'Alexandria',
            weatherModel!.cityName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
          Text(
            'updated at : ${weatherModel!.date} ',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.cloud, size: 64, color: Colors.white),
              Image.asset(
                AppAssets.getWeatherImage(weatherModel?.condition),
                width: 90,
                height: 90,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  weatherModel!.temp.toString(),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp: ${weatherModel!.maxTemp}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'minTemp: ${weatherModel!.minTemp}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            weatherModel!.condition,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
