import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 310, 
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 244, 239, 239),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(31, 0, 0, 0),
                blurRadius: 10, 
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, size: 35),
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.transparent
                
              ),
            ),
          ),
        SizedBox(width: 10,),
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 0, 0), 
            borderRadius: BorderRadius.circular(15),
          ),
          child:  Icon(Icons.settings, color: Colors.white,size: 30,),
          
          
        ),
        SizedBox(width: 15,)
      ],
      
    );
  }
}
