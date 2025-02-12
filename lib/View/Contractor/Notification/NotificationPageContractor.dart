// ignore_for_file: library_prefixes

import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/View/Contractor/Notification/Controller/NotificationPageController.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fixit/Model/Notification.dart' as Noti;

class NotificationPageContractor extends StatelessWidget {
  const NotificationPageContractor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '108'.tr,
          style: TextStyles.title,
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<NotificationPageContractorController>(
        builder: (context, controller, child) => ListView(
          padding: EdgeInsets.all(16),
          children: [
            FutureBuilder<List<Noti.Notification>>(
                future: controller.getMyNotification(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return  Center(child: Text('198'.tr));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
                      itemCount: controller.listnotification.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.15),
                                        blurRadius: 0.5,
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/U.png',
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Gap(15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              controller.listnotification[index]
                                                  .content!,
                                            ),
                                          ),
                                          Text(
                                            "${DateFormat('h:mm a').format(DateTime.parse(controller.listnotification[index].created_at!).toLocal())}",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("208".tr));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
