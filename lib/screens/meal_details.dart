import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';

// MealDetails sınıfı, bir yemek detay ekranını temsil eder ve ConsumerStatefulWidget türündedir
class MealDetails extends ConsumerStatefulWidget {
  // MealDetails sınıfının yapıcı metodu, bir anahtar ve bir yemek nesnesi alır
  const MealDetails({super.key, required this.meal});
  
  // Yemek nesnesi
  final Meal meal;

  // Widget'ın state'ini oluşturan metod
  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

// _MealDetailsState, MealDetails widget'ının state'ini yönetir
class _MealDetailsState extends ConsumerState<MealDetails> {
  // Widget'ın görünümünü oluşturan metod
  @override
  Widget build(BuildContext context) {
    // favoritesProvider ile sağlanan favori yemekleri dinle
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    // Scaffold widget'ı ile sayfanın temel yapısı oluşturulur
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
        actions: [
          // Favori ikonu ve favoriye ekleme/çıkarma işlemi
          IconButton(
            onPressed: () {
              ref.read(favoriteMealsProvider.notifier).toggleMealFavorite(widget.meal);
            },
            icon: Icon(favoriteMeals.contains(widget.meal) ? Icons.favorite : Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Yemek resmi
            Image.network(
              widget.meal.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Yemek detayları
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Malzemeler başlığı
                  Text(
                    'Malzemeler',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  // Malzemeler listesi
                  for (var ingredient in widget.meal.ingredients)
                    Text('- $ingredient'),
                  const SizedBox(height: 16),
                  // Açıklama başlığı
                  Text(
                    'Açıklama :',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  // Yemek açıklaması
                  Text(widget.meal.description ?? 'Açıklama bulunmamaktadır.'),
                  const SizedBox(height: 16),
                  // Pişirme süresi başlığı
                  Text(
                    'Pişirme Süresi',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  // Pişirme süresi
                  Text(widget.meal.cookingTime ?? 'Bilgi bulunmamaktadır.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
