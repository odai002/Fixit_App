

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Widgets/Custom_Button.dart';
import '../../../../Widgets/Custom_DropdownMenu.dart';

import '../../../../Widgets/custom_textfield.dart';
import '../../../../Widgets/custom_textfield_verify.dart';

import '../../../../Widgets/custom_image_text_button.dart' as button;


class Taskpage extends StatefulWidget {
  const Taskpage({super.key});

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  final titleController = TextEditingController();
  final describeController = TextEditingController();
  final locationController = TextEditingController();
  String selectedCountry = '';
  String selectedCity = '';

  final List<button.ImageTextButton> _imageButtons = [];


  @override
  void initState() {
    super.initState();
    _imageButtons.addAll([
      button.ImageTextButton(
        imageProvider: const AssetImage('assets/4.jpg'),
        onRemove: () => _removeImage(0),
      ),
      button.ImageTextButton(
        imageProvider: const AssetImage('assets/5.jpg'),
        onRemove: () => _removeImage(1),
      ),
      button.ImageTextButton(
        imageProvider: const AssetImage('assets/6.jpg'),
        onRemove: () => _removeImage(2),
      ),
      button.ImageTextButton(
        imageProvider: const AssetImage('assets/7.jpg'),
        onRemove: () => _removeImage(3),
      ),
    ]);
  }
  void _addImage(File image) {
    final imageButton = button.ImageTextButton(
      imageProvider: FileImage(image),
      onRemove: () => _removeImage(_imageButtons.length-1),
    );
    setState(() {
      _imageButtons.add(imageButton);
    });
  }


  void _removeImage(int index) {
    setState(() {
      _imageButtons.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Task Creation",
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(32.2),
            child: Column(
                children: [
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Task Title:",
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        CustomTextFieldVerify(
                          maxLine: 1,
                          HintText: 'Type Title...',
                          maxLength: 100,
                          controller: titleController,
                          prefixIcon: null,
                          inputType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          width: 220,
                          align: TextAlign.left,
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 33),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Task Description : ",
                                  style: GoogleFonts.getFont(
                                    'Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        CustomTextFieldVerify(
                          maxLine: 20,
                          HintText: 'Describe your task here...',
                          maxLength: 400,
                          controller: describeController,
                          prefixIcon: null,
                          inputType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          width: 300,
                          align: TextAlign.left,
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 33),
                  Column(
                    children: [
                      const SizedBox(height: 33),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Task Picture: ",
                                  style: GoogleFonts.getFont(
                                    'Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80,
                                child: AddButton(onImageSelected: _addImage),
                              ),
                              const SizedBox(width: 12),
                              ..._imageButtons.map((button) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: SizedBox(
                                    width: 80,
                                    child: button,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 33),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Task Location : ",
                                  style: GoogleFonts.getFont(
                                    'Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownMenuExample(
                            items: const ['Syria', 'Jordan', 'Qatar'],
                            onSelected: (String value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          ),
                          const SizedBox(width: 22),
                          DropdownMenuExample(
                            items: const ['Damascus', 'Aleppo', 'Homs', 'Amman', 'Doha'],
                            onSelected: (String value) {
                              setState(() {
                                selectedCity = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 33),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CustomTextField(
                      validator: (value) {
                        return null;
                      },
                      maxLength: 100,
                      obscureText: false,
                      controller: locationController,
                      name: "Type the Location of your task...",
                      prefixIcon: Icons.streetview_rounded,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: null,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CustomButton(
                      width: 250,
                      textcolor: 0xffffffff,
                      text: 'Send Task',
                      backgroundColor:const Color(0xff6A3BA8),
                      onPressed: () async {
                        // Implement your onPressed logic here
                      },
                      height: 50,
                      fontSize: 16,
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final Function(File) onImageSelected;

  const AddButton({super.key, required this.onImageSelected});

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      onImageSelected(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(context),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40, color: Colors.grey),
        ),
      ),
    );
  }
}