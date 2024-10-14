import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/Custom_Button.dart';
import '../../../Widgets/Custome_image_Button_H.dart';
import '../../../Widgets/custom_textfield_verify.dart';



class ContractPage extends StatefulWidget {

  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {


  final dateController = TextEditingController();
  final priceController = TextEditingController();
  final DateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title:  Padding(
          padding: const EdgeInsets.only(left: 80),
          child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(

                    text:  "Contract",
                    style: GoogleFonts.getFont('Libre Caslon Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ]
            ),
          ),
        ),
        leading: BackButton(
          color: Colors.black, // Customizing the color of the back button
          onPressed: () {
            Navigator.pop(context);
          },
          // You can also customize the icon by providing a different icon widget
          // icon: Icon(Icons.arrow_back),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child:SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,

          ),
          child:   Container(
            width:  double.maxFinite,
            padding: EdgeInsets.all(32.2),
            child: Column  (
              children: [
                SizedBox(height: 13),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Task Title:",
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ]

                        ),

                      ),
                      SizedBox(width: 12),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Repair",
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ]

                        ),

                      ),

                    ],
                  ),

                ),

                SizedBox(height: 23),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Payment Dead Line",
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ]

                        ),

                      ),
                      SizedBox(width: 12),

                      CustomTextFieldVerify(
                        maxLine: 1,
                        HintText: 'type date....',
                        maxLength: 100,
                        controller: dateController,
                        prefixIcon: null,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, width: 160, align: TextAlign.left, height: 50,
                      ),
                    ],
                  ),

                ),

                SizedBox(height: 33),

                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(

                                  text:  "Task Description : ",
                                  style: GoogleFonts.getFont('Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ]

                          ),

                        ),
                      ),
                      SizedBox(height: 22),

                      Container(
                        height: 220,
                        width: 400,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,),

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 12,
                                  spreadRadius: 0.5,
                                  offset: Offset.fromDirection(90))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22,top: 22,right: 14,bottom: 14),
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(

                                    text:  "Repairing the shelf and lights. ",
                                    style: GoogleFonts.getFont('Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
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

                ),
                SizedBox(height: 33),

                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(

                            text:  "Task Picture: ",
                            style: GoogleFonts.getFont('Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff000000),
                            ),
                          ),
                        ]

                    ),

                  ),
                ),

                SizedBox(height: 12),

                SingleChildScrollView (
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 100,

                    child: Row(
                      children: [

                        SizedBox(width: 3.6),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('images/download.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('images/download.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('images/download.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('images/download.jpg'), text: '',),
                        SizedBox(width: 12),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 33),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Task Price : ",
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ]

                        ),

                      ),

                      SizedBox(width: 12),

                      CustomTextFieldVerify(
                        maxLine: 1,
                        HintText: 'type price....',
                        maxLength: 100,
                        controller: priceController,
                        prefixIcon: null,
                        inputType: TextInputType.number,
                        textCapitalization: TextCapitalization.words, width: 210, align: TextAlign.left, height: 50,
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 33),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Task Done Date :",
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ]

                        ),

                      ),

                      SizedBox(width: 12),

                      CustomTextFieldVerify(
                        maxLine: 1,
                        HintText: 'type date...',
                        maxLength: 100,
                        controller: DateController,
                        prefixIcon: null,
                        inputType: TextInputType.datetime,
                        textCapitalization: TextCapitalization.words, width: 180, align: TextAlign.left, height: 50,
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 33),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(

                            text:  "Task Location : ",
                            style: GoogleFonts.getFont('Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff000000),
                            ),
                          ),
                        ]

                    ),

                  ),
                ),

                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,),

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12,
                                spreadRadius: 0.5,
                                offset: Offset.fromDirection(90))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(

                                    text:  "Syria",
                                    style: GoogleFonts.getFont('Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ]

                            ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:18),
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,),

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 12,
                                  spreadRadius: 0.5,
                                  offset: Offset.fromDirection(90))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(

                                      text:  "Damascus",
                                      style: GoogleFonts.getFont('Libre Caslon Text',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ]

                              ),

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(

                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,),

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 12,
                              spreadRadius: 0.5,
                              offset: Offset.fromDirection(90))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22,right: 12,top: 15),
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Street oliver/building52",
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ]

                        ),

                      ),
                    ),
                  ),
                ),


                SizedBox(height: 50),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: 'Send Contract',
                    backgroundColor: Color(0xff6A3BA8),
                    onPressed: () {
                      }, height: 50, fontSize: 12,
                  ),
                ),


              ],

            ),
          ),

        ),
      ),
    );


  }

}

