import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screen/Home_Owner/Input_onwer/Home_app/task_page.dart';
import 'Custom_Button.dart';
import 'Custom_Star_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final Image image;
  final String name;
  final String email;
  final String desc;
  final String number;
  final String category;
  final String local;

  const CustomCard({
    Key? key,
    required this.image,
    required this.email,
    required this.desc,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6,
                        spreadRadius: 0.2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: image,
                  ),
                ),
                SizedBox(width: 16),
                // Name, Category, and Star Ratings
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.libreCaslonText(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            category,
                            style: GoogleFonts.libreCaslonText(
                              fontSize: 8,
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          // Stars in top right corner
                          Row(
                            children: List.generate(4, (index) {
                              return Icon(Icons.star, color: Colors.yellow, size: 8);
                            })..add(Icon(Icons.star, color: Colors.grey, size: 8)),
                          ),

                        ],
                      ),
                      SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              desc,
                              style: GoogleFonts.libreCaslonText(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
            // "Hire Again" Button on the left and Description on the right
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Taskpage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6A3BA8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Hire Again',
                    style: GoogleFonts.libreCaslonText(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                // Description aligned to the right of the button

              ],
            ),
            SizedBox(height: 8),
            // Location, Email, and Phone Row with reduced spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWithText(
                  icon: Icons.location_on,
                  text: local,
                ),
                IconWithText(
                  icon: Icons.email_rounded,
                  text: email,
                ),
                IconWithText(
                  icon: Icons.phone_android_rounded,
                  text: number,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// IconWithText widget for displaying Icon and Text
class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  IconWithText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Color(0xff9747FF), size: 12),
        SizedBox(width: 2), // Reduced spacing
        Container(
          width: 70,
          child: Text(
            text,
            style: GoogleFonts.libreCaslonText(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Color(0xff7F7F7F),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}




