import 'package:flutter/material.dart';

class HelpMenuPage extends StatelessWidget {
  const HelpMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yardım Menüsü'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yardım Menüsü',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bu menüde yardım alabileceğiniz konular hakkında bilgiler bulunmaktadır.',
              style: TextStyle(fontSize: 16),
            ),
            // İhtiyaca göre yardım menüsüne özgü diğer içerikleri ekleyebilirsiniz.
          ],
        ),
      ),
    );
  }
}
