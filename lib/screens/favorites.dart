import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/favorites_provider.dart';

// Favorites sınıfı, favori yemekleri listelemek için kullanılır ve ConsumerStatefulWidget türündedir
class Favorites extends ConsumerStatefulWidget {
  const Favorites({super.key});

  // Widget'ın state'ini oluşturan metod
  @override
  ConsumerState<Favorites> createState() => _FavoritesState();
}

// _FavoritesState, Favorites widget'ının state'ini yönetir
class _FavoritesState extends ConsumerState<Favorites> {
  @override
  Widget build(BuildContext context) {
    // favoritesProvider ile sağlanan favori yemekleri dinle
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    // Scaffold widget'ı ile sayfanın temel yapısı oluşturulur
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoriler"),
      ),
      body: ListView.builder(
        // Favori yemek sayısına göre liste oluşturulur
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) => ListTile(
          // Yemek adını içeren liste elemanı
          title: Text(favoriteMeals[index].name),
          // Favori ikonu ve favoriye ekleme/çıkarma işlemi
          trailing: IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Butona tıklandığında, favoriye ekleme/çıkarma işlemi gerçekleşir
              ref.read(favoriteMealsProvider.notifier).toggleMealFavorite(favoriteMeals[index]);
            },
          ),
        ),
      ),
    );
  }
}
