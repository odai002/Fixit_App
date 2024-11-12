import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';

import '../../../../../../Widgets/Custom_Star_widget.dart';

class CustomCard extends StatelessWidget {
  final Image image;
  final String name;
  final String email;
  final String desc;
  final String number;
  final String category;
  final String local;
  final double radius;

  const CustomCard({
    Key? key,
    required this.image,
    required this.name,
    required this.email,
    required this.desc,
    required this.number,
    required this.category,
    required this.local,
    this.radius = 55,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for Profile Picture, Name, Category, and Rating
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                Material(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                  child: CircleAvatar(

                    radius: 30,
                    backgroundImage: image.image,
                  ),
                ),
                SizedBox(width: 16),
                // Name, Category, and Rating
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.libreCaslonText(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        category,
                        style: GoogleFonts.libreCaslonText(
                          fontSize: 10,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      // Star Rating
                      StarDisplayWidget(
                    filledStar: Icon(Icons.star, color: Colors.yellow, size: 11),
                    unfilledStar: Icon(Icons.star, color: Colors.grey, size: 11),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Description
            Text(
              desc,
              style: GoogleFonts.libreCaslonText(
                fontSize: 12,
                color: Colors.grey[800],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12),
            // Location
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Color(0xff6A3BA8)),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    local,
                    style: GoogleFonts.libreCaslonText(color: Colors.grey[600],fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Email
            Row(
              children: [
                Icon(Icons.email, size: 16, color: Color(0xff6A3BA8)),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    email,
                    style: GoogleFonts.libreCaslonText(color: Colors.grey[600],fontSize: 12
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Phone Number
            Row(
              children: [
                Icon(Icons.phone, size: 16, color: Color(0xff6A3BA8)),
                SizedBox(width: 6),
                Text(
                  number,
                  style: GoogleFonts.libreCaslonText(color: Colors.grey[600],
                  fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Hire Now Button
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6A3BA8), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  'Hire Now',
                  style: GoogleFonts.libreCaslonText(color: Colors.white,fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





