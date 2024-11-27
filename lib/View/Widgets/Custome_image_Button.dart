import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final double imageHeight;
  final double radius;
  final String text;
  final Function(dynamic error)? onError;

  const ImageTextButton({
    super.key,
    required this.onPressed,
    required this.image,
    this.imageHeight = 77,
    this.radius = 22,
    required this.text,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Remove background color
      elevation: 0, // Reduced shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          width: 150, // You can adjust the width of the container if needed
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0), // No vertical padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image with reduced size
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius - 7),
                  topRight: Radius.circular(radius - 7),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, color: Colors.red),
                    );
                  },
                  width: double.infinity, // Image should take full width
                  height: imageHeight, // Smaller height for the image
                  fit: BoxFit.cover,
                ),
              ),

              // Purple box with text attached only to the bottom, no space between them
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff6A3BA8), // Purple background
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radius - 7),
                    bottomRight: Radius.circular(radius - 7),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  text,
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Avoid overflow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
