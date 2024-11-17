
import 'package:flutter/material.dart';


class SnackBarBodyCON extends StatelessWidget {

  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xff6A3BA8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 17,
                spreadRadius: 3,
                offset: Offset.fromDirection(90))
          ]
      ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          enableFeedback: false,
          onPressed: () {
          },
          icon: pageIndex == 0
              ? const Icon(
            Icons.settings,
            color: Colors.white,
            size: 21,
          )
              : const Icon(
            Icons.settings,
            color: Color(0xff9B6CD7),
            size: 21,
          ),
        ),
        IconButton(
          enableFeedback: false,
          onPressed: () {
          },
          icon: pageIndex == 1
              ? const Icon(
            Icons.home_rounded,
            color: Colors.white,
            size: 21,
          )
              : const Icon(
            Icons.home_rounded,
            color: Color(0xff9B6CD7),
            size: 21,
          ),
        ),
        IconButton(
          enableFeedback: false,
          onPressed: () {
          },
          icon: pageIndex == 2
              ? const Icon(
            Icons.person,
            color: Colors.white,
            size: 21,
          )
              : const Icon(
            Icons.person,
            color: Color(0xff9B6CD7),
            size: 21,
          ),
        ),

      ],
    ),
    );
  }
}