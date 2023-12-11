import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

// Dinamik durumu yöneten StateNotifier sınıfı
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // StateNotifier'ın yapıcı metodu, başlangıç durumunu boş bir liste olarak belirler
  FavoriteMealsNotifier() : super([]); // initial state belirleme

  // Yemek favori listesine ekleme veya çıkarma işlemini gerçekleştiren metod
  void toggleMealFavorite(Meal meal) {
    List<Meal> newState;
    // Eğer yemek favori listesinde ise çıkar, değilse ekler
    if (state.contains(meal)) {
      newState = state.where((element) => element.id != meal.id).toList();
    } else {
      newState = [...state, meal]; // spread operator ile yeni durumu oluştur
    }
    state = newState; // Yeni durumu atama

    // Alternatif olarak:
    // if (state.contains(meal)) {
    //   state.remove(meal);
    // } else {
    //   state.add(meal);
    // }
  }
}

// StateNotifierProvider, FavoriteMealsNotifier'ın sağlayıcısıdır.
// Bu, uygulama boyunca favori yemeklerin durumunu sağlayacak olan bir sağlayıcıdır.
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  // FavoriteMealsNotifier'ı oluşturup geri döndürür
  return FavoriteMealsNotifier();
});
