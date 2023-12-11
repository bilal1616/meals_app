import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/screens/categories.dart';

// Tema oluşturuluyor
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 212, 212, 30),
  ),
);

void main() {
  // Riverpod'un sağladığı ProviderScope ile uygulama kapsamında statelerin yönetileceği bir alan oluşturuluyor
  runApp(
    ProviderScope(
      child: MaterialApp(
        // Oluşturulan tema uygulamaya atanıyor
        theme: theme,
        // Ana ekran olarak 'Categories' ekranı belirleniyor
        home: const Categories(),
        // Debug banner'ının görünürlüğü kapatılıyor
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
