import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final double time; // Keep time as double for calculations
  final String description;

  const DetailsPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.time,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'), // You can set the app bar title here
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: title,  // Same Hero tag as used in the ProductCard
                child: Image.asset(imagePath, height: 328, width: 430, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 20),
                const SizedBox(width: 4),
                Text(rating.toString(), style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 20), // Space between rating and time
                const Icon(Icons.access_time, color: Colors.grey, size: 20),
                const SizedBox(width: 4),
                Text('${time.toInt()} min', style: const TextStyle(fontSize: 18)), // Displaying time as an integer
              ],
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20), // Add some space before the button

            // Add to Cart Button
            ElevatedButton(
              onPressed: () {
                // Implement add to cart functionality here
              },
              child: Center(child: const Text('Add to Cart', style: TextStyle(color: Colors.white))),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                backgroundColor: const Color.fromARGB(255, 255, 5, 5), // Adjust as necessary
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
