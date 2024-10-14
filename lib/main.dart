import 'package:fixit/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages:routes,
      ),
    );
  }
}
