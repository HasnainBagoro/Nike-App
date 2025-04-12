import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Carts extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String oldPrice;
  final String discount;
  const Carts({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imagePath),
            ),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bebasNeue(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      oldPrice,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                Text(
                  discount,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
