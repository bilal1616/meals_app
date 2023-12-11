import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MealsApp Hakkında'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MealsApp Hakkında',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'MealsApp, lezzetli yemek tariflerini keşfetmenize yardımcı olan bir mobil uygulamadır. '
              'Farklı kategorilerdeki yemekleri göz atabilir, favorilerinizi seçebilir ve özel yemek listeleri oluşturabilirsiniz.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Uygulama Hakkında Daha Fazla Bilgi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'MealsApp, Flutter framework kullanılarak geliştirilmiştir. '
              'Ayrıntılı bilgi ve kaynak kodları için GitHub sayfamızı ziyaret edebilirsiniz:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                // GitHub sayfasına yönlendirme işlemi
                // Örneğin: Navigator.push(context, MaterialPageRoute(builder: (context) => GitHubPage()));
              },
              child: Text(
                'https://github.com/kullaniciadi/mealsapp',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
