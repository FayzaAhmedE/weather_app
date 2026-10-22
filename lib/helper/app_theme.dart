import 'package:flutter/material.dart';

class AppTheme {
  static MaterialColor getWeatherThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    String lowerCondition = condition.toLowerCase();

    if (lowerCondition.contains('rain') || 
        lowerCondition.contains('drizzle') || 
        lowerCondition.contains('shower')) {
      return Colors.blue;
    } 
    else if (lowerCondition.contains('thunder')) {
      return Colors.deepPurple;
    } 
    else if (lowerCondition.contains('snow') || 
             lowerCondition.contains('blizzard') || 
             lowerCondition.contains('ice') || 
             lowerCondition.contains('sleet')) {
      return Colors.cyan;
    } 
    else if (lowerCondition.contains('cloud') || 
             lowerCondition.contains('overcast') || 
             lowerCondition.contains('fog') || 
             lowerCondition.contains('mist') || 
             lowerCondition.contains('haze') || 
             lowerCondition.contains('dust') || 
             lowerCondition.contains('sand')) {
      return Colors.blueGrey;
    } 
    else if (lowerCondition.contains('sunny') || 
             lowerCondition.contains('clear')) {
      return Colors.orange;
    } 
    else {
      return Colors.blue;
    }
  }
}