import 'package:flutter/material.dart';
import 'package:nike/Screens/home_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'images/logo.png',
          height: 70,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: Stack(
                  children: [
                    Text(
                      'Hello Nike Lovers',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 40,
                      child: Image.asset(
                        'images/shoe bgr.png',
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'New Arrivals',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 260,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  children: [
                    HomeCards(
                        imagePath: 'images/shoe 1.jpg',
                        title: 'Nike Air Max',
                        price: '\$500',
                        onTap: () {}),
                    const SizedBox(width: 20),
                    HomeCards(
                        imagePath: 'images/shoe 1.jpg',
                        title: 'Nike Air Max',
                        price: '\$500',
                        onTap: () {}),
                    const SizedBox(width: 20),
                    HomeCards(
                        imagePath: 'images/shoe 1.jpg',
                        title: 'Nike Air Max',
                        price: '\$500',
                        onTap: () {}),
                    const SizedBox(width: 20),
                    HomeCards(
                        imagePath: 'images/shoe 1.jpg',
                        title: 'Nike Air Max',
                        price: '\$500',
                        onTap: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
