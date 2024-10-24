import 'package:flutter/material.dart';
import 'package:flutter_foodgo/pages/home.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
           Stack(
            children:[ Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: const [
                     
                      Color.fromRGBO(255, 164, 164, 1),
                       Color.fromARGB(255, 255, 0, 0),   
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 240),
                  child: Center(
                    child: GestureDetector(
                       onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                      child: 
                    Image.asset('assets/Foodg.png',),
                    ),
                  ),
                ),
              ),
            
             Positioned(
              top: 620,
                bottom: 0, 
                left: 0,
                right: 210,
              
                child:SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, 
                    children: [
              
                      Image.asset(
                        'assets/burger1.png', 
                        width: 270,
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ),
             Positioned(
                top: 699,
                bottom: 0, 
               
                left: 115,
                child: SingleChildScrollView(
                  child: Column(
                                 
                    children: [
                      Image.asset(
                        'assets/burger2.png', 
                        width: 200,
                        height: 220,
                      ),
                   
                    ],
                  ),
                ),
              ),
            ],
          ),
        
      ),
    );
  }
}