import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Search',
              style: GoogleFonts.bebasNeue(
                  fontSize: 24, fontWeight: FontWeight.bold),
            )),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for products',
              hintStyle: GoogleFonts.bebasNeue(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            onChanged: (value) {
              // Handle search logic here
            },
          ),
        ));
  }
}
