64dd9fe85c986706b8b1ae3d54d9f469


Center(
              child: FutureBuilder<List<Weather>>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<Weather> forecast = snapshot.data!;

                    // Extracting weather, temperature, and wind information
                    Weather firstWeather = forecast[0];
                    String city = "Red Deer, CA";
                    String? weatherCondition = firstWeather.weatherMain;
                    double? temperature = firstWeather.temperature?.celsius;
                    double? windSpeed = firstWeather.windSpeed;

                    return Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text('$city',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Weather Condition: $weatherCondition'),
                        Text('Temperature: $temperature °C'),
                        Text('Wind Speed: $windSpeed m/s'),
                      ],
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),
            ),
