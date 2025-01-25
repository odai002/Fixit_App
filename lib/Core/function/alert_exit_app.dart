import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> AlertExitApp() {
  Get.defaultDialog(
      title: "Warning",
      middleText: "Do you want Close App?",
      titleStyle: const TextStyle(color: Color(0xff59308E)),
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: const Text("yes"),
        ),
        const SizedBox(
          width: 3,
        ),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("No")),
      ]);
  return Future.value(true);
}
