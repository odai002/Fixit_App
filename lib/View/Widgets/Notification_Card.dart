import 'package:flutter/gestures.dart';
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
            color: Colors.grey.shade400,
            blurRadius: 7,
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
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 0.5,
                        spreadRadius: 0.2,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/U.png',
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: GoogleFonts.getFont(
                        'Libre Caslon Text',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: const Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: message,
                    style: GoogleFonts.getFont(
                      'Libre Caslon Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: const Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: "  Show Contract",
                        style: TextStyle(
                          color: const Color(0xff6A3BA8),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle "Show Contract" action
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          if (buttons != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buttons!.map((buttonText) {
                return Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Accept/Refuse action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonText == 'Accept'
                            ? const Color(0xff6A3BA8)
                            : Colors.white,
                        side: const BorderSide(color: Color(0xff6A3BA8)),
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
                            color: buttonText == 'Accept'
                                ? Colors.white
                                : const Color(0xff6A3BA8),
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
