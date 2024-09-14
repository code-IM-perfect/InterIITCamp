import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LiveData extends StatefulWidget {
  const LiveData({super.key});

  @override
  State<LiveData> createState() => _LiveDataState();
}

class _LiveDataState extends State<LiveData> {
  double temp = 23.0;
  String status = "Clear";
  double wind = 200;
  String windDir = "E";

  @override
  void initState() {
    super.initState();
    fetchWeather("kanpur");
    const oneMin = Duration(minutes: 1);
    Timer.periodic(oneMin, (Timer t) => fetchWeather("kanpur"));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            const Text(
              "Kanpur Weather",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "$temp°C",
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.air),
                Text("${wind}kmph "),
                Text(
                  windDir,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(status)
          ],
        ),
      ),
    );
  }

  void fetchWeather(String city) async {
    if (kDebugMode) {
      print("fetching weather");
    }
    final url =
        "http://api.weatherapi.com/v1/current.json?key={API_KEY_HERE}&q=$city";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final booksJson = jsonDecode(body);
    final currentData = booksJson['current'];
    setState(() {
      temp = currentData['temp_c'];
      wind = currentData['wind_kph'];
      windDir = currentData['wind_dir'];
      status = currentData['condition']['text'];
    });
    if (kDebugMode) {
      print(temp);
      print(wind);
      print(status);
      print(windDir);
      print("completed fetching weather");
    }
  }
}
