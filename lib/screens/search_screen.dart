import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/views/famous_cities_view.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/widgets/round_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          Row(
            children: [
              Expanded(
                child: RoundTextField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 15),
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.accentBlue,
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 30),

          /// Handles empty + search automatically
          FamousCitiesView(searchText: searchText),
        ],
      ),
    );
  }
}
