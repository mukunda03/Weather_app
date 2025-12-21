import 'package:flutter/material.dart';
import 'package:weather_app/models/famous_city.dart';
import 'package:weather_app/screens/weather_detail_screen.dart';
import 'package:weather_app/widgets/famous_city_tile.dart';

class FamousCitiesView extends StatelessWidget {
  final String searchText; //  optional search text

  const FamousCitiesView({super.key, this.searchText = ''});

  @override
  Widget build(BuildContext context) {
    final cities = searchText.isEmpty
        ? famousCities
        : famousCities.where((city) {
            return city.name.toLowerCase().startsWith(searchText.toLowerCase());
            // use contains() if needed
          }).toList();

    return GridView.builder(
      itemCount: cities.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final city = cities[index];

        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => WeatherDetailScreen(cityName: city.name),
              ),
            );
          },
          child: FamousCityTile(city: city.name, index: index),
        );
      },
    );
  }
}
