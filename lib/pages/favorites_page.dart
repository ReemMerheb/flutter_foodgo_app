
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorite_products.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = Provider.of<FavoriteProducts>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products'),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteProducts.favorites[index]),
          );
        },
      ),
    );
  }
}
