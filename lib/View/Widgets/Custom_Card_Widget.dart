import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Custom_Button.dart';
import 'Custom_Star_widget.dart';

class CustomCard extends StatelessWidget {
  final Image image;
  final String name;
  final String email;
  final String desc;
  final String number;
  final String category;
  final String local;
  final String buttonText;
  final Function(int) onPressed;
  final int id;


  const CustomCard({
    super.key,
    required this.image,
    required this.email,
    required this.desc,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
    required this.buttonText,
    required this.onPressed, required this.id,

});

  @override
  Widget build(BuildContext context) {
      return Card(
        color: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 18, right: 20, bottom: 9),
                child: StarDisplayWidget(
                  filledStar: Icon(Icons.star, color: Colors.green, size: 11),
                  unfilledStar: Icon(Icons.star, color: Colors.grey, size: 11),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: Offset.fromDirection(90),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              'assets/U.png',
                              fit: BoxFit.cover,
                              width: 45,
                              height: 45,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        fontSize: 7.5,
                        width: 80,
                        height: 50,
                        textcolor: 0xffffffff,
                        backgroundColor: const Color(0xff6A3BA8),
                        onPressed: ()=>onPressed(id), text:buttonText,
                      ),
                      const SizedBox(height: 22),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: name,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 18),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: category,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 8,
                                      color: Color(0xff7F7F7F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Container(
                          width: 200,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: desc,
                                  style: GoogleFonts.getFont(
                                    'Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 9),
                        Row(
                          children: [
                            const Icon(
                              Icons.map,
                              color: Color(0xff9747FF),
                              size: 11,
                              semanticLabel: 'Text to announce in accessibility modes',
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 80,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: local,
                                      style: GoogleFonts.getFont(
                                        'Libre Caslon Text',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 7,
                                        color: const Color(0xff7F7F7F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Column(
                              children: [
                                Icon(
                                  Icons.email_rounded,
                                  color: Color(0xff9747FF),
                                  size: 10,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                SizedBox(height: 2),
                                Icon(
                                  Icons.phone_android_rounded,
                                  color: Color(0xff9747FF),
                                  size: 10,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                              ],
                            ),
                            const SizedBox(width: 2),
                            Column(
                              children: [
                                Container(
                                  width: 90,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: email,
                                          style: GoogleFonts.getFont(
                                            'Libre Caslon Text',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 7,
                                            color: Color(0xff7F7F7F),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  width: 90,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: number,
                                          style: GoogleFonts.getFont(
                                            'Libre Caslon Text',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 7,
                                            color: const Color(0xff7F7F7F),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
