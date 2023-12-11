class Meal {
  // Meal sınıfı, uygulamadaki yemekleri temsil eder.
  // Her bir yemek bir ID, kategori ID, isim, resim URL, malzemeler, açıklama ve pişirme süresi içerir.

  const Meal({
    required this.id, // Yemek ID'si, benzersiz bir tanımlayıcıdır.
    required this.categoryId, // Yemeğin ait olduğu kategori ID'si.
    required this.name, // Yemeğin adı.
    required this.imageUrl, // Yemeğin resim URL'si.
    required this.ingredients, // Yemeğin malzemeleri, bir dize listesi.
    this.description, // Yemeğin açıklaması, opsiyonel ve null olabilir.
    this.cookingTime, // Yemeğin pişirme süresi, opsiyonel ve null olabilir.
  });

  final String id; // Yemek ID'si.
  final String categoryId; // Yemeğin ait olduğu kategori ID'si.
  final String name; // Yemeğin adı.
  final String imageUrl; // Yemeğin resim URL'si.
  final List<String> ingredients; // Yemeğin malzemeleri, bir dize listesi.
  final String? description; // Yemeğin açıklaması, null olabilen bir String.
  final String? cookingTime; // Yemeğin pişirme süresi, null olabilen bir String.
}
