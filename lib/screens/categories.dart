import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/datas.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/pages/about_page.dart';
import 'package:mealsapp/pages/help_menu_page.dart';
import 'package:mealsapp/pages/hunger_page.dart';
import 'package:mealsapp/screens/favorites.dart';
import 'package:mealsapp/screens/meal_list.dart';
import 'package:mealsapp/widgets/category_card.dart';
import 'package:mealsapp/providers/meals_provider.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  // Kategoriye tıklandığında çağrılacak metod
  void _selectCategory(BuildContext context, Category category) {
    final container = ProviderContainer();
    final List<Meal> filteredMeals = container
        .read(mealsProvider)
        .where((meal) => meal.categoryId == category.id)
        .toList();

    // Seçilen kategoriye ait yemek listesi sayfasına geçiş
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealList(meals: filteredMeals),
      ),
    );

    // Konteyneri temizle
    container.dispose();
  }

  // Drawer içindeki öğeleri oluşturan metod
  List<Widget> _buildDrawerItems(BuildContext context) {
    return [
      ListTile(
        leading: Icon(Icons.favorite, color: Colors.black),
        title: Text(
          'Favoriler',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500, 
          ),
        ),
        onTap: () {
          // Favori sayfasına geçiş
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => Favorites()),
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.account_circle, color: Colors.black),
        title: Text(
          'Kullanıcı Profili 1',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          // Kullanıcı profili seçim dialogunu göster
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Kullanıcı Profili Seçin'),
                content: Column(
                  children: [
                    // Kullanıcı profili seçenekleri
                    ListTile(
                      leading:
                          Icon(Icons.account_circle, color: Colors.white70),
                      title: Text(
                        'Kullanıcı Profili 1',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.account_circle, color: Colors.white70),
                      title: Text(
                        'Kullanıcı Profili 2',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.account_circle, color: Colors.white70),
                      title: Text(
                        'Kullanıcı Profili 3',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.local_dining, color: Colors.black),
        title: Text(
          'Bugün Ne Yesem?',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          // "Bugün Ne Yesem?" sayfasına geçiş
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HungerPage()),
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.help, color: Colors.black),
        title: Text(
          'Yardım Menüsü',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          // Yardım Menüsü sayfasına geçiş
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpMenuPage()),
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.info, color: Colors.black),
        title: Text(
          'MealsApp Hakkında',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          // MealsApp Hakkında sayfasına geçiş
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bir kategori seçin"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Favori sayfasına geçiş
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => Favorites()),
              );
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.filter_list),
            itemBuilder: (context) {
              return categories
                  .map(
                    (category) => PopupMenuItem(
                      child: Text(category.name),
                      value: category.id,
                    ),
                  )
                  .toList();
            },
            onSelected: (categoryId) {
              final container = ProviderContainer();
              final List<Meal> filteredMeals = container
                  .read(mealsProvider)
                  .where((meal) => meal.categoryId == categoryId)
                  .toList();

              // Seçilen kategoriye ait yemek listesi sayfasına geçiş
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MealList(meals: filteredMeals),
                ),
              );

              // Konteyneri temizle
              container.dispose();
            },
          ),
        ],
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2,
        ),
        children: [
          for (final category in categories)
            CategoryCard(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 154, 151, 151),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("resimler/food.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Color.fromARGB(255, 80, 80, 80),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kategori Menü',
                    style: TextStyle(
                      color: Color.fromARGB(255, 230, 228, 228),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 5, 5, 5),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                ],
              ),
            ),
            ..._buildDrawerItems(context),
          ],
        ),
      ),
    );
  }
}
