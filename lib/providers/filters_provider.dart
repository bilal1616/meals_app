import 'package:flutter_riverpod/flutter_riverpod.dart';

// Filtreleme işlemi için kullanılacak StateNotifier sınıfı
class FilterNotifier extends StateNotifier<List<String>> {
  // StateNotifier'ın yapıcı metodu, başlangıç durumunu boş bir liste olarak belirler
  FilterNotifier() : super([]); // initial state belirleme
}

// StateNotifierProvider, FilterNotifier'ın sağlayıcısıdır.
// Bu, uygulama boyunca filtreleme durumunu sağlayacak olan bir sağlayıcıdır.
final FilterProvider = StateNotifierProvider<FilterNotifier, List<String>>((ref) {
  // FilterNotifier'ı oluşturup geri döndürür
  return FilterNotifier();
});
