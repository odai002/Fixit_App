import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatelessWidget {
  final String username;
  final String message;
  final String time;
  final List<String>? buttons;
  final double screenWidth;
  final double screenHeight;
  final int contractId;
  final Function(int) onAccept;
  final Function(int) onReject;

  NotificationCard({super.key,
    required this.username,
    required this.message,
    required this.time,
    this.buttons,
    required this.screenWidth,
    required this.screenHeight,
    required this.contractId,
    required this.onAccept,
    required this.onReject,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Text(
                  username,
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for description and text button
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: GoogleFonts.getFont(
                      'Libre Caslon Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle "Show Contract" action
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "Show Contract",
                    style: TextStyle(
                      color: Color(0xff6A3BA8),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
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
                        if (buttonText == 'Accept') {
                          onAccept(contractId);
                        } else if (buttonText == 'Refuse') {
                          onReject(contractId);
                        }
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
