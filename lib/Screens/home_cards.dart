import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCards extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final Function() onTap;

  const HomeCards(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.price,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        width: 152,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imagePath,
                height: 120,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      price,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 16,
                  child: IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 16,
                      color: Colors.white,
                    ),
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
