import 'package:sun_set/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherServices {
  final String apikey = '5b9aacbd850d6c15c631d4cfeb70fdef';

  //  Future<Weather> featchWeather(String cityName) async {
  //    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey');
  //    final response = await http.get(url);

  //    if (response.statusCode == 200) {
  //     //  final Map<String, dynamic> data = jsonDecode(response.body);
  //      return Weather.fromJson(json.decode(response.body));
  //    } else {
  //      throw Exception('Failed to load weather data');
  //    }
  //  }
  Future<Weather> featchWeather(String cityName) async {
    try {
      final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Optional: Check for required fields before parsing
        if (data.containsKey('main') && data.containsKey('weather')) {
          return Weather.fromJson(data);
        } else {
          throw Exception('Malformed weather data');
        }
      } else {
        final errorData = json.decode(response.body);
        final message = errorData['message'] ?? 'Failed to load weather data';
        throw Exception('Error ${response.statusCode}: $message');
      }
    } catch (e) {
      throw Exception('Network or parsing error: $e');
    }
  }
}
