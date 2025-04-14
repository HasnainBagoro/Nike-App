import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Components/profile_fields.dart';
import 'package:nike/Screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 150,
              child: Container(
                height: 470,
                width: 330,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 140,
                      ),
                       ProfileFields(
                        profileText: 'Edit Profile',
                        profileIcon: Icon(Icons.edit, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       ProfileFields(
                        profileText: 'Change Password',
                        profileIcon: Icon(Icons.lock, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       ProfileFields(
                        profileText: 'My Orders',
                        profileIcon:
                            Icon(Icons.shopping_bag, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       ProfileFields(
                        profileText: 'Logout',
                        profileIcon: Icon(Icons.logout, color: Colors.white,),
                        ontap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false,
                          );
                        },
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/hero1.png'),
              ),
            ),
            Positioned(
              top: 230,
              child: Text(
                'Muhammad Hasnain',
                style: GoogleFonts.bebasNeue(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )));
  }
}
