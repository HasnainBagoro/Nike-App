import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Models/products_model.dart';
import 'package:nike/Screens/home_cards.dart';
import 'package:nike/Screens/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var firestore = FirebaseFirestore.instance;
  List<Products> items = [];
  bool isLoading = false;
  Future<void> fetchData() async {
    try {
      var snapshot = await firestore.collection("products").get();
      items = snapshot.docs.map((doc) => Products.fromMap(doc.data())).toList();
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Text(
                            'Hello Nike Lovers',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 65,
                              fontWeight: FontWeight.bold,
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
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 197,
                      child: items.isEmpty
                          ? const Center(child: Text('No items available'))
                          : ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: HomeCards(
                                    imagePath: items[index].imageUrl,
                                    title: items[index].name,
                                    price: '\$${items[index].price}',
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => ProductsDetails(
                                                  items: items[index])));
                                    },
                                  ),
                                );
                              },
                              padding: const EdgeInsets.all(10),
                              scrollDirection: Axis.horizontal,
                            ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
