import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screen/Home_Owner/Input_onwer/Home_app/detail_page.dart';
import 'Custom_Star_widget.dart';
import 'Custom_Button.dart';

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
  final double radius;

  const CustomCard({
    super.key,
    required this.image,
    required this.name,
    required this.email,
    required this.desc,
    required this.number,
    required this.category,
    required this.local,
    required this.buttonText,
    required this.onPressed,
    required this.id,
    this.radius = 28,  // Set a default radius of 28 for the avatar size
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ContractorProfilePage()));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image(
                      image: image.image,
                      width: radius * 3,
                      height: radius * 3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name, Category, and Rating in one row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: GoogleFonts.libreCaslonText(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8),
                            const StarDisplayWidget(
                              filledStar: Icon(Icons.star, color: Colors.yellow, size: 11),
                              unfilledStar: Icon(Icons.star, color: Colors.grey, size: 11),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text(
                          category,
                          style: GoogleFonts.libreCaslonText(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              // Description and Hire Button Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    fontSize: 8,
                    width: 80,
                    height: 40,
                    textcolor: 0xffffffff,
                    backgroundColor: const Color(0xFF6A3BA8),
                    onPressed: () => onPressed(id),
                    text: buttonText,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      desc,
                      style: GoogleFonts.libreCaslonText(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              // Bottom Row with Location, Email, and Phone
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Icons.location_on, size: 10, color: Color(0xFF6A3BA8)),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            local,
                            style: GoogleFonts.libreCaslonText(
                              fontSize: 8,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Icons.email, size: 10, color: Color(0xFF6A3BA8)),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            email,
                            style: GoogleFonts.libreCaslonText(
                              fontSize: 8,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Icons.phone, size: 10, color: Color(0xFF6A3BA8)),
                        SizedBox(width: 4),
                        Text(
                          number,
                          style: GoogleFonts.libreCaslonText(
                            fontSize: 8,
                            color: Colors.grey[600],
                          ),
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
