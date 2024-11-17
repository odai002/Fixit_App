import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controller/Contractor/homepage_contractor_controller.dart';
import '../../Core/constant/route.dart';
import 'Custom_Button.dart';

class CustomCardCON extends StatelessWidget {
  final Image image;
  final String name;
  final String email;
  final String desc;
  final String number;
  final String category;
  final String local;
  final Function() onViewTask;

   CustomCardCON({
    super.key,
    required this.image,
    required this.email,
    required this.desc,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
    required this.onViewTask


  });
  @override
  Widget build(BuildContext context) {
    ContractorHomeController controller=Get.find();
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        child:
           SingleChildScrollView( // Wrap with SingleChildScrollView
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
                     padding: const EdgeInsets.all(0.0),
                          icon: const Icon(
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
                            Obx(()=> CustomButton(
                                fontSize:6.5,
                                                  width: 80,
                                                  height: 10,
                                                  textcolor: 0xffffffff,
                                                  backgroundColor: const Color(0xff6A3BA8),
                                                  onPressed: () {
                                  Get.toNamed(AppRoute.ContractPage);

                                                  }, text:controller.contractStatus.value,

                              ),
                            ),
                        const SizedBox(height: 12),

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
                                          color: const Color(0xff000000),
                                        ),
                                      ),

                                    ]
                                ),
                              ),
                              const SizedBox(width: 18),

                            ],
                          ),

                          const SizedBox(height: 7),

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
                                              color: const Color(0xff000000),
                                            ),
                                          ),

                                          TextSpan(
                                            onEnter:onViewTask(),
                                            text:  ": View Task"
                                            ,
                                            style: GoogleFonts.getFont('Libre Caslon Text',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                              color: const Color(0xff000000),
                                            ),
                                          ),

                                        ]
                                    ),
                                  ),
                                ),
                              ),

                            ],
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

                                          text:  local
                                          ,
                                          style: GoogleFonts.getFont('Libre Caslon Text',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 7,
                                            color: const Color(0xff7F7F7F),
                                          ),
                                        ),

                                      ]
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

                                              text:  email
                                              ,
                                              style: GoogleFonts.getFont('Libre Caslon Text',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 7,
                                                color: const Color(0xff7F7F7F),
                                              ),
                                            ),

                                          ]
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
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
                                                color: const Color(0xff7F7F7F),
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
    )
          )
      );
  }
}