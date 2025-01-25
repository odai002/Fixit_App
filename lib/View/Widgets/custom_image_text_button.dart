import 'package:flutter/material.dart';

class ImageTextButton extends StatelessWidget {
  final ImageProvider imageProvider;
  final VoidCallback onRemove;

  const ImageTextButton(
      {super.key, required this.imageProvider, required this.onRemove});

  void _resizeImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(child: Image(image: imageProvider)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Positioned(
          top: 4,
          left: 4,
          child: GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, color: Colors.red, size: 20),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => _resizeImage(context),
            child: const Icon(Icons.zoom_in, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
