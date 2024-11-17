import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatelessWidget {
  final String username;
  final String message;
  final String time;
  final List<String>? buttons;
  final double screenWidth;
  final double screenHeight;

  NotificationCard({
    required this.username,
    required this.message,
    required this.time,
    this.buttons,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20,bottom: 10 ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset.fromDirection(90))
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/U.png',
                      fit: BoxFit.cover,
                      width: 40,
                      height: 45,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Text(
                  username,
                  style: GoogleFonts.getFont('Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            message,
              style: GoogleFonts.getFont('Libre Caslon Text',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: const Color(0xff000000),
          ),
          ),
          if (buttons != null) ...[
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buttons!.map((buttonText) {
                return Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonText == 'Accept' ? Colors.purple : Colors.white,
                      side: const BorderSide(color: Colors.purple),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.02,
                      ),
                    ),
                    child: FittedBox(
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: buttonText == 'Accept' ? Colors.white : Colors.purple,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ]
        ],
      ),
    );
  }
}