import 'package:flutter/material.dart';

class TextFailedWithWidget extends StatelessWidget {
  const TextFailedWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          decoration:InputDecoration(
            hintText:'Type title...',
          ),
        )
      ],
    );
  }
}
