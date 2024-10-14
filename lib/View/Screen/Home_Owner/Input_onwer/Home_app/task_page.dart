

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Widgets/Custom_Button.dart';
import '../../../../Widgets/Custom_DropdownMenu.dart';
import '../../../../Widgets/Custome_image_Button_H.dart';
import '../../../../Widgets/custom_textfield.dart';
import '../../../../Widgets/custom_textfield_verify.dart';


class Taskpage extends StatefulWidget {

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {


  final titleController = TextEditingController();
  final describeController = TextEditingController();
  final locationController = TextEditingController();
  String selectedCountry='';
  String selectedCity='';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title:  Padding(
          padding: const EdgeInsets.only(left: 60),
          child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(

                    text:  "Task Creation",
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
                SizedBox(height: 12),
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

                      CustomTextFieldVerify(
                        maxLine: 1,
                        HintText: 'Type Title...',
                        maxLength: 100,
                        controller: titleController,
                        prefixIcon: null,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, width: 220, align: TextAlign.left, height: 50,
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
                      SizedBox(height: 12),

                      CustomTextFieldVerify(
                        maxLine: 20,
                        HintText: 'describe your task here...',
                        maxLength: 400,
                        controller: describeController,
                        prefixIcon: null,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, width: 300, align: TextAlign.left, height: 200,

                      ),
                    ],
                  ),

                ),

                SizedBox(height: 33),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:12),
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
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        DropdownMenuExample(
                          items: ['Syria','Jordan','Qatar'],
                          onSelected:(String value){
                            setState(() {
                              selectedCountry = value;
                            });
                          },

                        ),
                        SizedBox(width: 22),

                        DropdownMenuExample(
                          items: ['Damascus','Aleepo','Homs','Amman','AL_Douha'],
                          onSelected:(String value){
                            setState(() {
                              selectedCity=value;
                            });
                          },


                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 33),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: CustomTextField(
                    validator:(value){},
                    maxLength: 100,
                    obscureText: false,
                    controller: locationController,
                    name: "Type the Location of your task..",
                    prefixIcon: Icons.streetview_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words, suffixIcon: null,
                  ),

                ),
                SizedBox(height: 33),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left:12),
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
                ),
                SizedBox(height: 12),

                SingleChildScrollView (
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [

                        SizedBox(width: 12),
                        Container(child: ImageTextButton(),width:80,),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('assets/5.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('assets/5.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('assets/6.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('assets/7.jpg'), text: '',),
                        SizedBox(width: 12),


                      ],
                    ),
                  ),
                ),

                SizedBox(height: 50),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: 'Send Task',
                    backgroundColor: Color(0xff6A3BA8),
                    onPressed: () async{

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

class ImageTextButton extends StatefulWidget {
  @override
  _ImageTextButtonState createState() => _ImageTextButtonState();
}

class _ImageTextButtonState extends State<ImageTextButton> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: _pickImage,
          child: _image == null
              ? Image.asset('assets/Union.png',width: 80,)
              : Image.file(_image!,height:80),
        ),
        // SizedBox(height: 100),
        //Text(_image == null ? 'Add image' : 'Image selected.'),
      ],
    );
  }
}