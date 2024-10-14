import 'package:flutter/material.dart';


class ImageTextButtonH extends StatelessWidget {
  final VoidCallback onPressed;
  final ImageProvider image;
  final double imageHeight;
  final double radius;
  final String text;

  ImageTextButtonH({
    required this.onPressed,
    required this.image,
    this.imageHeight = 80,
    this.radius = 12,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Material(
      color:  Colors.white ,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        clipBehavior: Clip.hardEdge,
        child: GestureDetector(
          onTap: onPressed,
          child: InkWell(

            onTap:onPressed,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  width: 80,
                  image: image,
                  height: imageHeight,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
        ),
    );
  }
}