import 'package:flutter/material.dart';
import 'package:flutter_foodgo/pages/details_page.dart';
import 'package:provider/provider.dart';
import '../models/favorite_products.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  final double time;
  final Animation<double> animation;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.time,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              imagePath: imagePath,
              title: title,
              rating: rating,
              time: time,
              description: _getDescriptionForBurger(title),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Hero(
              tag: title, 
              child: ScaleTransition(
                scale: animation,
                child: Image.asset(imagePath, height: 120, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text(rating.toString()),
                        ],
                      ),
                      Consumer<FavoriteProducts>(
                        builder: (context, favoriteProducts, child) {
                          final isFavorite = favoriteProducts.isFavorite(title);
                          return IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ?Color.fromARGB(255, 255, 0, 0) : const Color.fromARGB(255, 46, 45, 45),
                            ),
                            onPressed: () {
                              favoriteProducts.toggleFavorite(title);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _getDescriptionForBurger(String title) {
  switch (title) {
    case 'Cheeseburger':
      return 'The Cheeseburger Wendys Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, its topped with melted American cheese.';
    case 'Veggie Burger':
      return 'Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.';
    case 'Chicken Burger':
      return 'Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. ';
    case 'Fried Chicken Burger':
      return 'Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.';
    default:
      return '';
  }
}
