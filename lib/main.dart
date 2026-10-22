import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/screens/homeScreen.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherCubit(weatherServices: WeatherServices());
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      //first screen in the app
      home: HomeScreen(),
    );
  }
}
