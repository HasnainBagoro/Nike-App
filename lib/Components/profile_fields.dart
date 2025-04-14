import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileFields extends StatefulWidget {
  final String profileText;
  final Icon profileIcon;
  final Function()? ontap;

  const ProfileFields(
      {super.key, required this.profileText, required this.profileIcon, this.ontap});

  @override
  State<ProfileFields> createState() => _ProfileFieldsState();
}

class _ProfileFieldsState extends State<ProfileFields> {

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.profileText,
                style: GoogleFonts.bebasNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Icon(widget.profileIcon.icon, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
