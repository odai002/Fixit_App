import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final double imageHeight;
  final double radius;
  final String text;
  final Function(dynamic error)? onError; // Error handler

  const ImageTextButton({
    super.key,
    required this.onPressed,
    required this.image,
    this.imageHeight = 66,
    this.radius = 12,
    required this.text,
    this.onError, // Optional error handler
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff6A3BA8),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),  // عرض تحميل أثناء تحميل الصورة
              ),
              errorWidget: (context, url, error) {
                return const Icon(Icons.error, color: Colors.white);  // عرض أيقونة خطأ إذا لم تشتغل الصورة
              },
              width: 88,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: GoogleFonts.getFont(
                'Libre Caslon Text',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
