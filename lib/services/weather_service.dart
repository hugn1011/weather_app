
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService{
  final String apiKey = "310bbfa1c64a4e6d895104551240608";
  final String forecastBaseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  final String searchBaseUrl = 'http://api.weatherapi.com/v1/search.json';

  Future<Map<String, dynamic>> fetchCurrenWeather(String city) async{
    final url = '$forecastBaseUrl?key=$apiKey&q=$city&days=1&api=no&alerts=no';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw Exception('Fail to load forecast data');
    }
  }

  Future<Map<String, dynamic>> fetch7DayForecast(String city) async{
    final url = '$forecastBaseUrl?key=$apiKey&q=$city&days=7&api=no&alerts=no';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw Exception('Fail to load forecast data');
    }
  }

  Future<List<dynamic>?> fetchCitySuggestions(String query) async{
    final url = '$searchBaseUrl?key=$apiKey&q=$query';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      return null;
    }
  }
}