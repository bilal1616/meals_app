import 'package:flutter/material.dart';

class Category {
  // Category sınıfı, uygulamadaki kategorileri temsil eder.
  // Her bir kategori bir ID, isim ve renk içerir.

  const Category({
    required this.id, // Kategori ID'si, benzersiz bir tanımlayıcıdır.
    required this.name, // Kategorinin adı.
    this.color = Colors.orange, // Kategorinin varsayılan rengi turuncudur.
  });

  final String id; // Kategori ID'si.
  final String name; // Kategorinin adı.
  final Color color; // Kategorinin rengi, varsayılan olarak turuncu.
}
