import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meal_details.dart';

// MealCard sınıfı, yemek kartlarını oluşturmak için kullanılır
class MealCard extends StatelessWidget {
  // MealCard'ın yapıcı metodu, bir anahtar ve bir yemek nesnesi alır
  const MealCard({super.key, required this.meal});

  // Yemek nesnesi
  final Meal meal;

  // Widget'ın build metodu, kartın görünümünü oluşturur
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      // InkWell, tıklanabilir bir alan oluşturur
      child: InkWell(
        onTap: () {
          // Kart'a tıklandığında, MealDetails ekranına geçiş yapılır
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => MealDetails(meal: meal),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Yemek resmi
            Image.network(
              meal.imageUrl,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            // Yemek bilgileri
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Yemek adı
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Malzemeler
                  Text(
                    "Malzemeler: ${meal.ingredients.join(', ')}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            // "Ürüne Git" butonu
            ElevatedButton(
              onPressed: () {
                // Butona tıklandığında, MealDetails ekranına geçiş yapılır
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => MealDetails(meal: meal),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant_sharp), // İstenilen ikonu buraya ekleyin
                  SizedBox(
                      width: 8), // İkon ve metin arasına biraz boşluk ekleyin
                  Text("Lezzete Git"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
