import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Widgets/Custom_App_bar.dart';
import '../../../../Widgets/Custom_Bottom_naf_Bar.dart';
import '../../../../Widgets/Custome_image_Button.dart';
import 'Category_Page/category_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String email = 'example@gmail.com';
  final String number = '0933445522';
  final String name = 'mhamad alshame';
  final String category = 'electrication';
  final String local = 'oliver333/builder44';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: SnackBarBody(),
      appBar: CustomAppBar(title: ''),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(child:  
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Pick a",
                              style: GoogleFonts.getFont(
                                'Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Flexible(child: 
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Service",
                              style: GoogleFonts.getFont(
                                'Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff6A3BA8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Flexible(child: 
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "that you need!",
                              style: GoogleFonts.getFont(
                                'Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/1.png',
                        'Carpenter',
                        'Carpenter',
                      ),
                    ),
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/2.png',
                        'Movers',
                        'Movers',
                      ),
                    ),
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/13.jpg',
                        'Air Conditioning',
                        'Air Conditioning',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/14.png',
                        'Plumbing',
                        'Plumbing',
                      ),
                    ),
                    Expanded(child: 
                      _buildImageButton(
                        context,
                       'assets/5.jpg',
                        'HVAC',
                        'HVAC',
                      ),
                    ),
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/6.jpg',
                        'Landscaping',
                        'Landscaping',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04, bottom: screenHeight * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/7.jpg',
                        'Cleaning',
                        'Cleaning',
                      ),
                    ),
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/8.jpg',
                        'Snow Removal',
                        'Snow Removal',
                      ),
                    ),
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/9.jpg',
                        'Electrician',
                        'Electrician',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/10.jpg',
                        'Cleaning',
                        'Cleaning',
                      ),
                    ),
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/11.jpg',
                        'Handyman',
                        'Handyman',
                      ),
                    ),
                    Expanded(child: 
                      _buildImageButton(
                        context,
                        'assets/12.jpg',
                        'Flooring',
                        'Flooring',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton(BuildContext context, String imagePath, String text, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ImageTextButton(
        onPressed: () {
          /*/ Navigator.of(context).push(
       MaterialPageRoute(
          builder: (context) => (
                email: email,
                number: number,
                name: name,
                category: category,
                local: local,
              ),
            ),
          );*/
        },
        image: AssetImage(imagePath),
        text: text,
      ),
    );
  }
}
