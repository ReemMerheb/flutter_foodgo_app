import 'package:flutter/material.dart';
import 'package:flutter_foodgo/models/chat_model.dart';
import 'package:flutter_foodgo/models/favorite_products.dart';
import 'package:flutter_foodgo/models/profile_model.dart';
import 'package:flutter_foodgo/pages/first.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProducts()),
        ChangeNotifierProvider(create: (context) => MessagesChats()),
        ChangeNotifierProvider(create: (context) => UserProfile(
          name: 'Sophia Patel',
          email: 'sophiapatel@gmail.com',
          address: '123 Main St Apartment 4A, New York, NY',
          password: '********',
        )),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
