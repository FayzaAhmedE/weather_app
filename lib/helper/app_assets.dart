
class AppAssets {
  static const String blizzard = 'assets/Blizzard.png';
  static const String cloudy = 'assets/cloudy.png';
  static const String lightning = 'assets/lightning-bolt.png'; 
  static const String overcast = 'assets/overcast.png';
  static const String rain = 'assets/rain.png';
  static const String sandstorm = 'assets/sandstorm.png';
  static const String smoke = 'assets/smoke.png';
  static const String snowflake = 'assets/snowflake.png';
  static const String sun = 'assets/sun.png';

  static String getWeatherImage(String? condition) {
    if (condition == null) {
      return sun; 
    }
    
    String lowerCondition = condition.toLowerCase();

    if (lowerCondition.contains('thunder')) {
      return lightning;
    } 
    else if (lowerCondition.contains('rain') || 
             lowerCondition.contains('drizzle') || 
             lowerCondition.contains('shower')) {
      return rain;
    } 
    else if (lowerCondition.contains('blizzard')) {
      return blizzard;
    } else if (lowerCondition.contains('snow') || 
             lowerCondition.contains('ice') || 
             lowerCondition.contains('sleet')) {
      return snowflake;
    } 
    else if (lowerCondition.contains('sand') || 
             lowerCondition.contains('dust')) {
      return sandstorm;
    } 
    else if (lowerCondition.contains('fog') || 
             lowerCondition.contains('mist') || 
             lowerCondition.contains('haze') || 
             lowerCondition.contains('smoke')) {
      return smoke;
    } 
    else if (lowerCondition.contains('overcast')) {
      return overcast;
    } 
    else if (lowerCondition.contains('cloud')) {
      return cloudy;
    } 
    else if (lowerCondition.contains('sunny') || 
             lowerCondition.contains('clear')) {
      return sun;
    } 
    else {
      return sun;
    }
  }
}