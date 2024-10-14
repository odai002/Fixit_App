import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../Widgets/Custom_Button.dart';
import '../../../../../../Widgets/Custom_Star_widget.dart';
import '../../task_page.dart';


class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18,right: 20,bottom: 9),
                child: Container(
                  child: StarDisplayWidget(filledStar:Icon(Icons.star, color: Colors.green, size: 11),
                     unfilledStar: Icon(Icons.star, color: Colors.grey, size: 11),

                  ),
                ),
              ),
              Row(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                              width: 45,
                              height: 45,
                            ),
                          ),
                        ),
                      ),
                          CustomButton(
                            fontSize:6.5,
                            width: 80,
                            height: 0,
                            textcolor: 0xffffffff,
                            text: 'Hire No',
                            backgroundColor: Color(0xff6A3BA8),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Taskpage()));
                  },

                          ),
                      SizedBox(height: 22),

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

                                      text:  "Mhamad Alshame",
                                      style: GoogleFonts.getFont('Libre Caslon Text',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Color(0xff000000),
                                      ),
                                    ),

                                  ]
                              ),
                            ),
                            SizedBox(width: 18),
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(

                                      text:  "Electrician",
                                      style: GoogleFonts.getFont('Libre Caslon Text',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 8,
                                        color: Color(0xff7F7F7F),
                                      ),
                                    ),

                                  ]
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 7),

                        Container(

                          width: 200,
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(

                                    text:  "im Dedicated, professional and highly experienced electrical engineer who has been in the field for nearly 20 years...... "
                                        ,
                                    style: GoogleFonts.getFont('Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Color(0xff000000),
                                    ),
                                  ),

                                ]
                            ),
                          ),
                        ),
                        SizedBox(height: 9),
                        Row(
                          children: [
                            Icon(
                              Icons.map,
                              color: Color(0xff9747FF),
                              size: 11,
                              semanticLabel: 'Text to announce in accessibility modes',
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 80,
                              child: RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(

                                        text:  "Syria / Rif Damashq / 55666 Olive Viaduct"
                                        ,
                                        style: GoogleFonts.getFont('Libre Caslon Text',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 7,
                                          color: Color(0xff7F7F7F),
                                        ),
                                      ),

                                    ]
                                ),
                              ),
                            ),
                            Column(
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
                            SizedBox(width: 2),
                            Column(
                              children: [
                                Container(
                                  width: 90,
                                  child: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(

                                            text:  "Mhamad233@gmail.com"
                                            ,
                                            style: GoogleFonts.getFont('Libre Caslon Text',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 7,
                                              color: Color(0xff7F7F7F),
                                            ),
                                          ),

                                        ]
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 90,
                                  child: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(

                                            text:  "0945113366"
                                            ,
                                            style: GoogleFonts.getFont('Libre Caslon Text',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 7,
                                              color: Color(0xff7F7F7F),
                                            ),
                                          ),

                                        ]
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
      ),
    );
  }
}