import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            MaterialButton(onPressed: ()async{
              SharedPreferences sharedprf= await SharedPreferences.getInstance();
              sharedprf.setString("name","ali");

            }, child:Text("svae name"),)
          ,

            MaterialButton(onPressed: ()async{
              SharedPreferences sharedprf=await SharedPreferences.getInstance();
            String name=  sharedprf.getString("name")!;
              print(name);
            }, child:Text("print name"),)],
        )

      ),
    );
  }
}
