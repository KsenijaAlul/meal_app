import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailScreen({required this.meal, super.key});

  void openYoutube() async {
    if (meal.youtubeLink.isNotEmpty) {
      final uri = Uri.parse(meal.youtubeLink);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(meal.thumbnail),
            SizedBox(height: 16),
            Text('Instructions', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(meal.instructions),
            SizedBox(height: 16),
            Text('Ingredients', style: TextStyle(fontWeight: FontWeight.bold)),
            ...meal.ingredients.entries.map(
              (e) => Text('${e.key} - ${e.value}'),
            ),
            SizedBox(height: 16),
            if (meal.youtubeLink.isNotEmpty)
              ElevatedButton.icon(
                onPressed: openYoutube,
                icon: Icon(Icons.play_arrow),
                label: Text('Watch on YouTube'),
              ),
          ],
        ),
      ),
    );
  }
}
