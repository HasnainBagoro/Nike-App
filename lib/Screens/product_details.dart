import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Components/button.dart';
import 'package:nike/Models/products_model.dart';

class ProductsDetails extends StatefulWidget {
  final Products items;
  const ProductsDetails({super.key, required this.items});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(widget.items.imageUrl),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.bottomRight,
                child:
                    Icon(Icons.favorite_rounded, color: Colors.grey, size: 40),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.items.name,
                    style: GoogleFonts.bebasNeue(fontSize: 40)),
                Text(' \$${widget.items.price}',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 30, color: Colors.black)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(widget.items.description,
                style:
                    GoogleFonts.bebasNeue(fontSize: 20, color: Colors.black)),
            const SizedBox(
              height: 20,
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: Button(text: 'buy now', onTap: () {})),
              ],
            )
          ],
        ),
      ),
    );
  }
}
