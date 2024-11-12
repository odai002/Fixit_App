import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Custom_Star_widget.dart';

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
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Profile Picture, Name, Category, and Star Rating
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),

                  elevation: 8,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: image.image,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name, Category, and Rating in one row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: GoogleFonts.libreCaslonText(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
                          const StarDisplayWidget(
                            filledStar: Icon(Icons.star, color: Colors.yellow, size: 11),
                            unfilledStar: Icon(Icons.star, color: Colors.grey, size: 11),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),

                      Text(
                        category,
                        style: GoogleFonts.libreCaslonText(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Description and Hire Button Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A3BA8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  ),
                  child: Text(
                    'Hire Now',
                    style: GoogleFonts.libreCaslonText(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                ),
                SizedBox(width: 8),

                Expanded(
                  child: Text(
                    desc,
                    style: GoogleFonts.libreCaslonText(
                      fontSize: 12,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

              ],
            ),
            SizedBox(height: 12),
            // Bottom Row with Location, Email, and Phone
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 10, color: Color(0xFF6A3BA8)),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          local,
                          style: GoogleFonts.libreCaslonText(
                            fontSize: 8,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      Icon(Icons.email, size: 10, color: Color(0xFF6A3BA8)),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          email,
                          style: GoogleFonts.libreCaslonText(
                            fontSize: 8,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      Icon(Icons.phone, size: 10, color: Color(0xFF6A3BA8)),
                      SizedBox(width: 4),
                      Text(
                        number,
                        style: GoogleFonts.libreCaslonText(
                          fontSize: 8,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





