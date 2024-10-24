import 'package:flutter/material.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  _CategoryFilterState createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  final List<String> categories = ["All", "Combos", "Sliders", "Classic"];
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FilterChip(
              label: Padding(
                padding: const EdgeInsets.only(left: 11,right: 11),
                child: Text(
                  category,
                  
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color.fromARGB(255, 122, 121, 121), 
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), 
              side: BorderSide(color:  const Color.fromARGB(255, 240, 234, 234), ),
             
              ),
              backgroundColor: const Color.fromARGB(255, 240, 234, 234),
              selectedColor: Color.fromARGB(255, 255, 0, 0), 
            
              onSelected: (isSelected) {
                setState(() {
                  selectedCategory = category; 
                });
              },
              selected: isSelected, 
            ),
          );
        }).toList(),
      ),
    );
  }
}
