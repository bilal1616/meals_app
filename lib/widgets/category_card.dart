import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';

// CategoryCard sınıfı, kategori kartlarını oluşturmak için kullanılır
class CategoryCard extends StatelessWidget {
  // CategoryCard'ın yapıcı metodu, bir anahtar, bir kategori nesnesi ve bir kategori seçildiğinde çalışacak bir fonksiyon alır
  const CategoryCard({
    Key? key,
    required this.category,
    required this.onSelectCategory,
  }) : super(key: key);

  // Kategori nesnesi
  final Category category;
  
  // Kategori seçildiğinde çalışacak fonksiyon
  final void Function() onSelectCategory;

  // Widget'ın build metodu, kategori kartının görünümünü oluşturur
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Tıklama efekti rengi
      splashColor: Theme.of(context).primaryColor,
      // Kart'a tıklandığında onSelectCategory fonksiyonunu çalıştırır
      onTap: () => onSelectCategory(),
      child: Container(
        padding: const EdgeInsets.all(16),
        // Kartın dekorasyonu (border-radius ve gradient)
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Kategori için ikon veya resim eklenmişse
            // İkon Kullanımı:
            Icon(
              Icons.restaurant_sharp, // İstediğiniz yemek ikonunu kullanın
              size: 30,
              color: Colors.black,
            ),

            SizedBox(height: 5),

            // Kategori adı
            Text(
              category.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
