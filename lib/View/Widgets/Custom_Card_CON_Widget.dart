import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screen/Contractor/Input_contractor/contract_page.dart';
import '../Screen/Home_Owner/Input_onwer/Home_app/task_page.dart';
import 'Custom_Button.dart';

class CustomCardCON extends StatelessWidget {
  final Image image;
  final String name;
  final String email;
  final String desc;
  final String number;
  final String category;
  final String local;

  const CustomCardCON({
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
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        child:  SingleChildScrollView( // Wrap with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

             Padding(
               padding: const EdgeInsets.only(right: 12,top: 9),
               child: SizedBox(
                 width: 22,
                 height: 22,
                 child: IconButton(
                          onPressed: () async {
                          },
                     padding: EdgeInsets.all(0.0),
                          icon: Icon(
                              color: Color(0xff9747FF),

                              size: 18,
                              Icons.delete)

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
                    height: 10,
                    textcolor: 0xffffffff,
                    text: (""),
                    backgroundColor: Color(0xff6A3BA8),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContractPage()));                  },

                            ),
                        SizedBox(height: 12),

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

                                        text:  name,
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

                            ],
                          ),

                          SizedBox(height: 7),

                          Row(
                            children: [
                              Container(

                                width: 200,
                                child: InkWell(
                                  child: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(

                                            text:  desc
                                                ,
                                            style: GoogleFonts.getFont('Libre Caslon Text',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          TextSpan(
                                            onEnter:(event) => Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>Taskpage())),
                                            text:  ": View Task"
                                            ,
                                            style: GoogleFonts.getFont('Libre Caslon Text',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              ),

                            ],
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

                                          text:  local
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

                                              text:  email
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

                                              text:  number
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