// ignore_for_file: library_prefixes

import 'dart:developer';

import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/HomeOwner/Contract/ContractPage.dart';
import 'package:fixit/View/HomeOwner/Contract/Controller/ContractControllerHomeOwner.dart';
import 'package:fixit/View/HomeOwner/Notification/Controller/NotificationPageController.dart';
import 'package:fixit/View/HomeOwner/Receipt/Controller/ReceiptControllerHomeOwner.dart';
import 'package:fixit/View/HomeOwner/Receipt/ReceiptPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fixit/Model/Notification.dart' as Noti;

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
      body: Consumer<NotificationPageController>(
        builder: (context, controller, child) => ListView(
          shrinkWrap: true,
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
                      physics: NeverScrollableScrollPhysics(),
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
                                      if (controller.listnotification[index]
                                                  .type ==
                                              'waitcontract' ||
                                          controller.listnotification[index]
                                                  .type ==
                                              'waitreceipt')
                                        Gap(20),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (controller.listnotification[index]
                                                  .type ==
                                              'waitcontract')
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  log(controller
                                                      .listnotification[index]
                                                      .idAction!
                                                      .toString());
                                                  CustomRoute.RouteTo(
                                                      context,
                                                      ChangeNotifierProvider(
                                                        create: (context) =>
                                                            ContractControllerHomeOwner()
                                                              ..getContractById(
                                                                  controller
                                                                      .listnotification[
                                                                          index]
                                                                      .idAction!),
                                                        builder: (context,
                                                                child) =>
                                                            ContractPageHomeOwner(),
                                                      ));
                                                },
                                                child: Container(
                                                  height: 30.h,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            Color(0xff6A3BA8),
                                                      ),
                                                      color: AppColors.active,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              11),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            blurRadius: 0.5,
                                                            spreadRadius: 0.5,
                                                            offset: Offset
                                                                .fromDirection(
                                                                    90))
                                                      ]),
                                                  padding: EdgeInsets.all(8),
                                                  child: Center(
                                                    child: Text("199".tr,
                                                        style:
                                                            TextStyles.button),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (controller.listnotification[index]
                                                  .type ==
                                              'waitreceipt')
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  log(controller
                                                      .listnotification[index]
                                                      .idAction!
                                                      .toString());
                                                  CustomRoute.RouteTo(
                                                      context,
                                                      //   ReceiptPage(),
                                                      // );
                                                      ChangeNotifierProvider(
                                                        create: (context) =>
                                                            ReceiptControllerHomeOwner()
                                                              ..getReceiptById(
                                                                  controller
                                                                      .listnotification[
                                                                          index]
                                                                      .idAction!),
                                                        builder: (context,
                                                                child) =>
                                                            ReceiptPageHomeOwner(),
                                                      ));
                                                },
                                                child: Container(
                                                  height: 30.h,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            Color(0xff6A3BA8),
                                                      ),
                                                      color: AppColors.active,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              11),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            blurRadius: 0.5,
                                                            spreadRadius: 0.5,
                                                            offset: Offset
                                                                .fromDirection(
                                                                    90))
                                                      ]),
                                                  padding: EdgeInsets.all(8),
                                                  child: Center(
                                                    child: Text("200".tr,
                                                        style:
                                                            TextStyles.button),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (controller.listnotification[index]
                                                  .type ==
                                              'waitreceipt')
                                            Gap(10),
                                          if (controller.listnotification[index]
                                                  .type ==
                                              'waitreceipt')
                                            TextButton(
                                              onPressed: () {
                                                controller.showReviewPopup(
                                                    context,
                                                    controller
                                                        .listnotification[index]
                                                        .senderId!);
                                              },
                                              child: Text(
                                                  "201".tr,
                                                  style: TextStyles.button
                                                      .copyWith(
                                                          color: AppColors
                                                              .active)),
                                            )
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
                    return const Center(child: Text("No notifications found"));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
