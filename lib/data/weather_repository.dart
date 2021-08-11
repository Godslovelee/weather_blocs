import 'dart:math';

import 'model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
  Future<Weather> fetchDetailedWeather(String cityName);
}

class AltWeatherRepository implements WeatherRepository {
  double cachedTempCelsius;


  @override
  Future<Weather> fetchWeather(String cityName) {

    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();


        if (random.nextBool()) {
          throw NetworkError();
        }


        cachedTempCelsius = 21 + random.nextInt(15) + random.nextDouble();

        // Return "fetched" weather
        return Weather(
          cityName: cityName,
          // Temperature between 21 and 35.99
          temperatureCelsius: cachedTempCelsius,
        );
      },
    );
  }

  @override
  Future<Weather> fetchDetailedWeather(String cityName) {

    return Future.delayed(
      Duration(seconds: 1),
      () {
        return Weather(
          cityName: cityName,
          temperatureCelsius: cachedTempCelsius,
          temperatureFahrenheit: cachedTempCelsius * 1.8 + 32,
        );
      },
    );
  }
}

class NetworkError extends Error {}
