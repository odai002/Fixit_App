// ignore_for_file: library_prefixes, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:flutter/material.dart';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fixit/Model/Notification.dart' as Noti;

class NotificationPageController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  Future<void> Rate(BuildContext context, int user_id) async {
    EasyLoading.show();
    try {
      final response = await client.request(
        path: AppApi.Rate,
        requestType: RequestType.POST,
        body: jsonEncode({
          'user_id': user_id,
          'comment': reviewcontroller.text,
          'rate': selectedRating
        }),
      );
      if (response.statusCode == 201) {
        EasyLoading.dismiss();
        CustomRoute.RoutePop(context);
        selectedRating = 1;
        reviewcontroller.clear();
      } else {
        log("Error accepting or reject contract: ${response.body}");
        EasyLoading.dismiss();
      }
    } catch (e) {
      log("Exception in AcceptContract: $e");
      EasyLoading.dismiss();
    }
  }

  List<Noti.Notification> listnotification = [];
  Future<List<Noti.Notification>> getMyNotification() async {
    listnotification.clear();
    try {
      final response = await client.request(
        path: AppApi.GetMyNotification,
        requestType: RequestType.GET,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log(data.toString());
        for (var element in data['data']) {
          listnotification.add(Noti.Notification.fromJson(element));
        }
        return listnotification;
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      log("Error fetching notifications: $e");
      throw Exception("Error occurred: $e");
    }
  }

  int selectedRating = 4;
  TextEditingController reviewcontroller = TextEditingController();
  void showReviewPopup(BuildContext context, int user_id) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "150".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "151".tr,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRating = index + 1;
                            });
                          },
                          child: Icon(
                            index < selectedRating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 20.w,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "152".tr,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 10),
                TextField(
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus!.unfocus(),
                  maxLines: 4,
                  controller: reviewcontroller,
                  decoration: InputDecoration(
                    hintText: "153".tr,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          log(selectedRating.toString());
                          log(reviewcontroller.text);
                          Rate(context, user_id);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6A3BA8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "154".tr,
                          style: TextStyle(
                              color: Colors.white), // Button text color
                        ),
                      ),
                    ),
                    Gap(10),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          CustomRoute.RoutePop(context);
                          selectedRating = 1;
                          reviewcontroller.clear();
                        },
                        child: Text(
                          "close",
                          style: TextStyle(
                              color: AppColors.active), // Button text color
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
