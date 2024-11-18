import 'package:flutter/material.dart';

import '../../Widgets/Custom_Bottom_naf_Bar.dart';
import '../../Widgets/Notification_Card.dart';
class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
        bottomNavigationBar: SnackBarBody(),
        resizeToAvoidBottomInset: true,
      body:Padding(
        padding: EdgeInsets.all(screenWidth * 0.09),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  const Icon(Icons.notifications_rounded,size: 60,color:Colors.black,),
                  const SizedBox(width: 5,),
                  Text('Notification',style:TextStyle(fontSize:screenWidth * 0.06,fontWeight:FontWeight.bold),),
                ],
              ),
              SizedBox(height: screenHeight * 0.06),
              Text(
                "Today",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              NotificationCard(
                username: 'Admin',
                message: 'we review your request and the receipt seems correct',
                time: '22:00',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              NotificationCard(
                username: 'Mohamad',
                message: 'Mohamad alshame has Finished your task, and here is your receipt : View receipt',
                time: '18:00',
                buttons: const ['Rate and Write A Review', 'Request admin Review'],
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Yesterday",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              NotificationCard(
                username: 'odai',
                message: 'odai suleman has accepted your task, and here is your contract : View contract',
                time: '18:00',
                buttons: ['Accept', 'Refuse'],
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              NotificationCard(
                username: 'Mhamad',
                message: 'Mhamad alshame has accepted your task, and here is your contract : View contract',
                time: '15:00',
                buttons: ['Accept', 'Refuse'],
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ],
          ),
        ),
      )
    );
  }
}