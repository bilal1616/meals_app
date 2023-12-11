import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/datas.dart'; // Varsayılan kategoriler ve yemek listesi
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/meals_provider.dart';
import 'package:mealsapp/screens/meal_list.dart';

class HungerPage extends StatelessWidget {
  const HungerPage({Key? key}) : super(key: key);

   void _selectCategory(BuildContext context, Category category) {
    final container = ProviderContainer();
    final List<Meal> filteredMeals = container
        .read(mealsProvider)
        .where((meal) => meal.categoryId == category.id)
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealList(meals: filteredMeals),
      ),
    );

    // Konteyneri temizle
    container.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bugün Ne Yesem?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bugün Ne Yesem?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bu sayfada, acıkmanızı giderecek harika yemek tariflerini bulabilirsiniz.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Kategori butonlarını oluşturarak kullanıcıya sunma
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final category in categories)
                  ElevatedButton(
                    onPressed: () {
                      _selectCategory(context, category);
                    },
                    child: Text(category.name),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
