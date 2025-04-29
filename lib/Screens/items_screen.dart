import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nike/Components/button.dart';
import 'package:nike/Components/text_fields.dart';
import 'package:nike/Models/iteams_model.dart';
import 'package:uuid/uuid.dart';

class ListingItems extends StatefulWidget {
  const ListingItems({super.key});

  @override
  State<ListingItems> createState() => ListingItemsState();
}

class ListingItemsState extends State<ListingItems> {
  var itemNameController = TextEditingController();
  var itemDesController = TextEditingController();
  var itemPriController = TextEditingController();
  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  bool isLoading = false;
  var firestore = FirebaseFirestore.instance;
  Future<void> pickImage() async {
    try {
      final XFile? selectedImage =
          await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        imageFile = selectedImage;
      });
    } catch (e) {
      debugPrint("Error while picking image: $e");
    }
  }

  void uploadData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var productId = Uuid().v1();
      Items items = Items(
          name: itemNameController.text,
          imageUrl:
              "https://www.asphaltgold.com/cdn/shop/files/NvFpHHjtm5BXTQGknxbY_FQ9084-001-Nike-Air-Terra-Humara-SP-Black-Black-Black-os-1_a5d0260e-6363-456f-8636-983bd59334df_1024x1024_crop_center.jpg?v=1726153963",
          description: itemDesController.text,
          price: itemPriController.text,
          productId: productId);
      await firestore.collection("products").doc(productId).set(items.toJson());

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item listed successfully'),
        ),
      );
    } catch (e) {
      debugPrint("Error while uploading data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    itemNameController.dispose();
    itemDesController.dispose();
    itemPriController.dispose();
    super.dispose();
  }

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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: imageFile != null
                          ? Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: FileImage(File(imageFile!.path)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              ),
                              child: Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: Colors.white,
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
                    Button(
                        text: 'List item',
                        onTap: () {
                          if (itemNameController.text.isNotEmpty &&
                              itemDesController.text.isNotEmpty &&
                              itemPriController.text.isNotEmpty) {
                            uploadData();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill all fields'),
                              ),
                            );
                          }
                        })
                  ],
                ),
              )),
            ),
    );
  }
}
