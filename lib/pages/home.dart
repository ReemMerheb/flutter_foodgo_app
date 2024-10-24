import 'package:flutter/material.dart';
import 'package:flutter_foodgo/widgets/bottom_navigation.dart';
import 'package:flutter_foodgo/widgets/category_filter.dart';
import 'package:flutter_foodgo/widgets/product_card.dart';
import '../widgets/custom_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();  // Start the animation when the page loads
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('assets/Foodgo.png'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profilepic.png'),
              radius: 26,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order your favorite food!',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(height: 40),
            CustomSearchBar(),
            SizedBox(height: 35),
            CategoryFilter(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.80,
                children: [
                  ProductCard(
                    imagePath: 'assets/Bug1.png',
                    title: 'Cheeseburger',
                    subtitle: 'Wendy\'s Burger',
                    rating: 4.9,
                    time:25,
                    animation: _animation,
                  ),
                  ProductCard(
                    imagePath: 'assets/Bug2.png',
                    title: 'Veggie Burger',
                    subtitle: 'Veggie Burger',
                    rating: 4.8,
                    time: 25,
                    animation: _animation,
                  ),
                  ProductCard(
                    imagePath: 'assets/Bug3.png',
                    title: 'Chicken Burger',
                    subtitle: 'Chicken Burger',
                    rating: 4.6,
                    time:25,
                    animation: _animation,
                  ),
                  ProductCard(
                    imagePath: 'assets/Bug4.png',
                    title: 'Fried Chicken Burger',
                    subtitle: 'Fried Chicken Burger',
                    rating: 4.5,
                    time:25,
                    animation: _animation,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 255, 0, 0), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), 
          side: BorderSide.none,
        ),
        child: Icon(
          Icons.add,
          color: const Color.fromARGB(255, 248, 242, 242),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
