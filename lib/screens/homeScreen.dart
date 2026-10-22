import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/cubit_states.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/helper/app_theme.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/no_weather_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        var weatherCubit = BlocProvider.of<WeatherCubit>(context);
        weatherData = weatherCubit.weatherModel;
        
        MaterialColor themeColor = AppTheme.getWeatherThemeColor(weatherData?.condition);

        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    themeColor,
                    themeColor[300]!,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchScreen();
                      },
                    ),
                  );
                },
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.search, size: 32, color: Colors.white),
                ),
              ),
            ],
            title: const Text(
              'Weather App',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            elevation: 16.0,
            shadowColor: Colors.black.withValues(alpha: 0.5),
          ),
          body: buildBody(state, weatherCubit),
        );
      },
    );
  }

  Widget buildBody(WeatherStates state, WeatherCubit weatherCubit) {
    if (state is LoadingWeatherState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SuccessWeatherState) {
      weatherData = weatherCubit.weatherModel;
      MaterialColor successThemeColor = AppTheme.getWeatherThemeColor(weatherData?.condition);

      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              successThemeColor,
              successThemeColor[300]!,
            ],
            begin: const FractionalOffset(0.0, 0.5),
            end: const FractionalOffset(0.5, 1.0),
          ),
        ),
        child: WeatherScreen(weatherModel: weatherData),
      );
    } else if (state is FailedWeatherState) {
      return const Center(child: Text('Something went wrong please try again'));
    } else {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
          ),
        ),
        child: const NoWeatherScreen(),
      );
    }
  }
}
