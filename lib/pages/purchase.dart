import 'package:flutter/material.dart';

class PurchasePage extends StatelessWidget {
  final String imagePath;

  const PurchasePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Item'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: imagePath,  // Same tag as in ProductCard
              child: Image.asset(imagePath, height: 300, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle purchase logic
              },
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
