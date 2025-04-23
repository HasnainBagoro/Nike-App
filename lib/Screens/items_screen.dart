import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Components/button.dart';
import 'package:nike/Components/text_fields.dart';

class ListingItems extends StatefulWidget {
  const ListingItems({super.key});

  @override
  State<ListingItems> createState() => ListingItemsState();
}

class ListingItemsState extends State<ListingItems> {
  var itemNameController = TextEditingController();
  var itemDesController = TextEditingController();
  var itemPriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Listing Items',
          style: GoogleFonts.bebasNeue(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_a_photo_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text('Item Name',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              CustomInputField(
                controller: itemNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Item Details',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              CustomInputField(
                controller: itemDesController,
                maxLines: 2,
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Item Price',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              CustomInputField(
                controller: itemPriController,
              ),
              const SizedBox(
                height: 70,
              ),
              Button(text: 'List item', onTap: () {})
            ],
          ),
        )),
      ),
    );
  }
}
