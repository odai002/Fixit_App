
import 'package:flutter/material.dart';

import '../Screen/Home_Owner/Input_onwer/Home_app/Home_page.dart';


// ignore: must_be_immutable
class SnackBarBody extends StatelessWidget {
  int pageIndex = 0;

  SnackBarBody({super.key});

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
            pageIndex = 0;
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: pageIndex == 0
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
            pageIndex = 1;
          },
          icon: pageIndex == 1
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
        IconButton(
          enableFeedback: false,
          onPressed: () {
          },
          icon: pageIndex == 3
              ? const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 21,
          )
              : const Icon(
            Icons.notifications,
            color: Color(0xff9B6CD7),
            size: 21,
          ),
        ),
      ],
    ),
    );
  }
}