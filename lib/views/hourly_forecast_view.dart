import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/int.dart';
import 'package:weather_app/providers/hourly_weather_provider.dart';
import 'package:weather_app/utils/get_weather_icons.dart';

class HourlyForecastView extends ConsumerWidget {
  const HourlyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);

    return hourlyWeatherData.when(
      data: (hourlyWeather) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: hourlyWeather.cnt,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final weather = hourlyWeather.list[index];
              return HourlyWeatherTile(
                id: weather.weather[0].id,
                hour: weather.dt.time,
                temp: weather.main.temp.round(),
                isActive: index == 0,
              );
            },
          ),
        );
      },
      error: (error, StackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class HourlyWeatherTile extends StatelessWidget {
  final int id;
  final String hour;
  final int temp;
  final bool isActive;
  const HourlyWeatherTile({
    super.key,
    required this.id,
    required this.hour,
    required this.temp,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, top: 12, bottom: 12),
      child: Material(
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15),
        elevation: isActive ? 8 : 0,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(getWeatherIcon(weatherCode: id), width: 50),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(hour, style: TextStyle(color: AppColors.white)),
                  const SizedBox(height: 5),
                  Text('$temp°', style: TextStyles.h3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyForecastBottomSheet extends StatelessWidget {
  const HourlyForecastBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // drag handle
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const Text('Hourly Forecast', style: TextStyles.h3),

          const SizedBox(height: 12),

          const HourlyForecastBottomSheetView(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class HourlyForecastBottomSheetView extends ConsumerWidget {
  const HourlyForecastBottomSheetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);

    return hourlyWeatherData.when(
      data: (hourlyWeather) {
        return Expanded(
          child: ListView.builder(
            itemCount: hourlyWeather.cnt,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final weather = hourlyWeather.list[index];
              return HourlyWeatherBottomSheetTile(
                id: weather.weather[0].id,
                hour: weather.dt.time,
                temp: weather.main.temp.round(),
                isActive: index == 0,
              );
            },
          ),
        );
      },
      error: (error, StackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class HourlyWeatherBottomSheetTile extends StatelessWidget {
  final int id;
  final String hour;
  final int temp;
  final bool isActive;
  const HourlyWeatherBottomSheetTile({
    super.key,
    required this.id,
    required this.hour,
    required this.temp,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15),
        elevation: isActive ? 8 : 0,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Time", style: TextStyles.subtitleText),
                  Text(hour, style: TextStyles.h3),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text("Temp", style: TextStyles.subtitleText),
                  Text("$temp°", style: TextStyles.h3),
                ],
              ),
              const SizedBox(width: 10),
              Image.asset(getWeatherIcon(weatherCode: id), width: 50),
            ],
          ),
        ),
      ),
    );
  }
}
