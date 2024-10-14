import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ImageTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ImageProvider image;
  final double imageHeight;
  final double radius;
  final String text;

  ImageTextButton({
    required this.onPressed,
    required this.image,
    this.imageHeight = 66,
    this.radius = 12,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Material(
      color:  Color(0xff6A3BA8) ,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(

        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink.image(
              width: 88,
              image: image,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 2),
            Text(

              text,
              style: GoogleFonts.getFont('Libre Caslon Text',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}