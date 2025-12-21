import 'package:flutter/material.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/datetime.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/views/hourly_forecast_view.dart';
import 'package:weather_app/views/weekly_forecast_view.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          Center(child: Text("ForeCast Report", style: TextStyles.h1)),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Today", style: TextStyles.h2),
              Text(DateTime.now().dateTime, style: TextStyles.subtitleText),
            ],
          ),
          const SizedBox(height: 20),
          HourlyForecastView(),
          const SizedBox(height: 20),
          Text("Next Forecast", style: TextStyles.h1),
          const SizedBox(height: 20),
          WeeklyForecastView(),
        ],
      ),
    );
  }
}
