import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Components/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style:
              GoogleFonts.bebasNeue(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Carts(
                    imagePath: 'images/shoe 1.jpg',
                    title: 'Nike Air Max 270',
                    price: '\$150',
                    oldPrice: '\$300',
                    discount: "50% OFF",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Carts(
                    imagePath: 'images/shoe 1.jpg',
                    title: 'Nike Air Max 270',
                    price: '\$150',
                    oldPrice: '\$300',
                    discount: "50% OFF",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Carts(
                    imagePath: 'images/shoe 1.jpg',
                    title: 'Nike Air Max 270',
                    price: '\$150',
                    oldPrice: '\$300',
                    discount: "50% OFF",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Carts(
                    imagePath: 'images/shoe 1.jpg',
                    title: 'Nike Air Max 270',
                    price: '\$150',
                    oldPrice: '\$300',
                    discount: "50% OFF",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Carts(
                    imagePath: 'images/shoe 1.jpg',
                    title: 'Nike Air Max 270',
                    price: '\$150',
                    oldPrice: '\$300',
                    discount: "50% OFF",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Carts(
                    imagePath: 'images/shoe 1.jpg',
                    title: 'Nike Air Max 270',
                    price: '\$150',
                    oldPrice: '\$300',
                    discount: "50% OFF",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
