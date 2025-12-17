import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/providers/get_weather_by_city_provider.dart';
import 'package:weather_app/utils/get_weather_icons.dart';

class FamousCityTile extends ConsumerWidget {
  final String city;
  final int index;
  const FamousCityTile({super.key, required this.city, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(getWeatherByCityNameProvider(city));

    return weatherData.when(
      data: (weather) {
        return Material(
          color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
          elevation: index == 0 ? 8 : 0,
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${weather.main.temp.round().toString()}°',
                            style: TextStyles.h2,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            weather.weather[0].description,
                            style: TextStyles.subtitleText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      getWeatherIcon(weatherCode: weather.weather[0].id),
                      width: 50,
                    ),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    weather.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, StackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
