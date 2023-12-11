import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mealsapp/models/meal.dart";

// mealsProvider, yemek listesini sağlayan bir Provider
final mealsProvider = Provider<List<Meal>>((ref) {
  // Sabit bir yemek listesi döndürülüyor
  return const [
    // Yemek öğeleri, Meal sınıfı kullanılarak tanımlanmış
    Meal(
      id: "1",
      categoryId: "1",
      name: "Mercimek Çorbası",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Mercimek_%C3%A7orbas%C4%B1_in_Ankara%2C_Turkey.jpg/800px-Mercimek_%C3%A7orbas%C4%B1_in_Ankara%2C_Turkey.jpg",
      ingredients: ["Su", "Mercimek", "Tuz", "Soğan", "Biraz sevgi"],
      description: "Lezzetli mercimek çorbası tarifi. Tam bir Türk klasiği.",
      cookingTime: "30 dakika",
    ),
    Meal(
      id: "2",
      categoryId: "1",
      name: "Tarhana Çorbası",
      imageUrl:
          "https://www.beypazarikurusu.com/image/cache/catalog/Tarhana-1000x1000.jpg",
      ingredients: ["Yogurt", "Un", "Domates", "Biber", "Nane"],
      description:
          "Şifa Deposu tarhana çorbası lezzeti. Bağışıklığı güçlendirir.",
      cookingTime: "30 dakika",
    ),
    Meal(
      id: "3",
      categoryId: "1",
      name: "Ezogelin Çorbası",
      imageUrl:
          "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/1d5f91d4-c020-4134-9c74-1b3d92717b59/Derivates/38b07ef1-64ca-4a67-8a23-46a46ffc688b.jpg",
      ingredients: ["Bulgur", "Mercimek", "Soğan", "Domates", "Biber"],
      description: "Geleneksel Türk mutfağının sevilen çorbalarından biri.",
      cookingTime: "40 dakika",
    ),
    Meal(
      id: "4",
      categoryId: "2",
      name: "Sigara Böreği",
      imageUrl:
          "https://cdn.ye-mek.net/App_UI/Img/out/420/2018/01/peynirli-sigara-boregi-resimli-yemek-tarifi(12).jpg",
      ingredients: ["Yufka", "Beyaz peynir", "Maydanoz", "Sıvı yağ"],
      description: "Sigara böreği yapımı. Harika bir çay saati atıştırmalığı.",
      cookingTime: "45 dakika",
    ),
    Meal(
      id: "5",
      categoryId: "2",
      name: "Patates Köftesi",
      imageUrl:
          "https://i.nefisyemektarifleri.com/2020/06/14/patates-koftesi-4.jpg",
      ingredients: ["Patates", "Bulgur", "Soğan", "Baharatlar"],
      description: "Geleneksel patates köftesi tarifi. Pratik ve lezzetli.",
      cookingTime: "30 dakika",
    ),
    Meal(
      id: "6",
      categoryId: "2",
      name: "Kaşarlı Mantar",
      imageUrl:
          "https://i.nefisyemektarifleri.com/2020/06/03/kasarli-mantar.jpg",
      ingredients: ["Mantar", "Kaşar peyniri", "Sarımsak", "Maydanoz"],
      description:
          "Fırında kaşarlı mantar tarifi. İster atıştırmalık ister ara sıcak.",
      cookingTime: "25 dakika",
    ),
    Meal(
      id: "7",
      categoryId: "3",
      name: "Adana Kebap",
      imageUrl:
          "https://cdn.yemek.com/mncrop/940/625/uploads/2016/05/adana-kebap-one-cikan.jpg",
      ingredients: ["Kıyma", "Biber salçası", "Baharatlar", "Soğan", "Yogurt"],
      description:
          "Geleneksel Adana kebap tarifi. Mangal ateşinde nefis bir lezzet.",
      cookingTime: "30-40 dakika",
    ),
    Meal(
      id: "8",
      categoryId: "3",
      name: "Soslu Tavuk",
      imageUrl:
          "https://i.nefisyemektarifleri.com/2022/04/26/mukemmel-soslu-tavuk.jpg",
      ingredients: ["Tavuk", "Soya sos", "Bal", "Zeytinyağı", "Baharatlar"],
      description: "Soslu tavuk tarifi. Mangal ateşinde nefis bir lezzet.",
      cookingTime: "30-40 dakika",
    ),
    Meal(
      id: "9",
      categoryId: "3",
      name: "Kaşarlı Tas Kebabı",
      imageUrl:
          "https://i.nefisyemektarifleri.com/2022/04/08/kasarli-taskebabi.jpg",
      ingredients: ["Kuzu eti", "Patlıcan", "Domates", "Biber", "Baharatlar"],
      description:
          "Kaşarlı tas kebabı tarifi. Mangal ateşinde nefis bir lezzet.",
      cookingTime: "30-40 dakika",
    ),
    Meal(
      id: "10",
      categoryId: "4",
      name: "Künefe",
      imageUrl:
          "https://nacaroglubursa.com/wp-content/uploads/2022/10/karisik-kunefe.jpg",
      ingredients: ["Tel kadayıf", "Peynir", "Tereyağı", "Şeker şurubu"],
      description: "Antep fıstığı şöleni süt ve meyvelerle harika bir lezzet.",
      cookingTime: "30-40 dakika",
    ),
    Meal(
      id: "11",
      categoryId: "4",
      name: "Çikolata Soslu Elma Topları",
      imageUrl:
          "https://i.nefisyemektarifleri.com/2023/11/20/cikolata-soslu-elma-toplari.jpg",
      ingredients: ["Elma", "Çikolata sosu", "Fındık", "Antep fıstığı"],
      description: "Çikolata soslu elma topları tarifi. Pratik ve lezzetli.",
      cookingTime: "30-40 dakika",
    ),
    Meal(
      id: "12",
      categoryId: "4",
      name: "Frambuazlı Tart Pasta",
      imageUrl:
          "https://i.nefisyemektarifleri.com/2023/12/09/frambuazli-tart-pasta.jpg",
      ingredients: ["Bisküvi", "Frambuaz", "Krem şanti", "Krem peynir"],
      description:
          "Frambuazlı tart pasta tarifi. Şık sunumuyla davet sofralarına uygun.",
      cookingTime: "30-40 dakika",
    ),
    Meal(
      id: "13",
      categoryId: "5",
      name: "Ayran",
      imageUrl:
          "https://www.elbetsteakhouse.com.tr/wp-content/uploads/2021/09/ayran-piknik-bu%CC%88fe.jpg",
      ingredients: ['Bilgi bulunmamaktadır.'],
      description: "Soğuk Tüketiniz...",
    ),
    Meal(
      id: "14",
      categoryId: "5",
      name: "Kola",
      imageUrl:
          "https://i.lezzet.com.tr/images-xxlarge-secondary/kolanin-kullanim-alanlari-nelerdir-36f4b230-4b4c-4765-aaf8-fb72ea196706.jpg",
      ingredients: ['Bilgi bulunmamaktadır.'],
      description: "Soğuk Tüketiniz...",
    ),
    Meal(
      id: "15",
      categoryId: "5",
      name: "Şalgam",
      imageUrl:
          "https://www.diyetkolik.com/site_media/media/customvideo_images/trn.png",
      ingredients: ['Bilgi bulunmamaktadır.'],
      description: "Soğuk Tüketiniz...",
    ),
    Meal(
      id: "16",
      categoryId: "6",
      name: "Rus Salatası",
      imageUrl:
          "https://cdn.yemek.com/mnresize/1250/833/uploads/2023/10/rus-salatasi-yemekcom.jpg",
      ingredients: ["Patates", "Havuç", "Bezelye", "Mayonez", "Tuz"],
      description: "Rus salatası tarifi. Hem pratik hem de lezzetli.",
    ),
    Meal(
      id: "17",
      categoryId: "6",
      name: "Hatay Usulü Kısır",
      imageUrl:
          "https://i.nefisyemektarifleri.com/2023/12/01/hatay-usulu-kisir.jpg",
      ingredients: ["Bulgur", "Domates salçası", "Nar ekşisi", "Yeşillikler"],
      description:
          "Hatay usulü kısır tarifi. İçerisinde nar ekşisiyle farklı bir lezzet.",
    ),
    Meal(
      id: "18",
      categoryId: "6",
      name: "Ezme",
      imageUrl: "https://i.nefisyemektarifleri.com/2023/12/09/ezme.jpg",
      ingredients: ["Domates", "Biber", "Soğan", "Nar ekşisi"],
      description:
          "Ezme tarifi. Meze olarak sofralardan eksik olmayan bir lezzet.",
    ),
  ];
});
