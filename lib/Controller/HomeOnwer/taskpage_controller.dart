import 'package:fixit/Core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../data/data_source/Remote/home onwer/sendTask_service.dart';

abstract class TaskpageController extends GetxController {
  void submitTask(int contractor_id);
}

class TaskpageControllerImp extends TaskpageController {
  List<String> Country = ['Syria', 'Jordan', 'Lebanon', 'Saudi Arabia', 'UAE', 'Iraq'];
  List<String> City = ['Damascus', 'Aleppo', 'Homs', 'Hama', 'Latakia', 'Tartus',
  'Idlib', 'Deir ez-Zor', 'Al-Hasakah', 'Raqqa', 'Daraa',
    'As-Suwayda', 'Quneitra'
    ,'Amman', 'Zarqa', 'Irbid', 'Aqaba', 'Balqa', 'Madaba',
    'Jerash', 'Mafraq', 'Karak', 'Tafilah', 'Ma\'an', 'Ajloun',
    'Beirut', 'Mount Lebanon', 'North Lebanon', 'South Lebanon',
    'Beqaa', 'Nabatieh',
    'Riyadh', 'Makkah', 'Medina', 'Eastern Province', 'Asir',
    'Tabuk', 'Hail', 'Jazan', 'Najran', 'Al Bahah', 'Al Jawf',
    'Northern Borders',
    'Abu Dhabi', 'Dubai', 'Sharjah', 'Ajman', 'Ras Al Khaimah',
    'Fujairah', 'Umm Al Quwain',
    'Baghdad', 'Basra', 'Mosul', 'Erbil', 'Sulaymaniyah',
    'Karbala', 'Najaf', 'Kirkuk', 'Anbar', 'Diyala',
    'Dhi Qar', 'Babil', 'Maysan', 'Wasit', 'Muthanna', 'Qadisiyyah'];
  GlobalKey<FormState> formstate88 = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController describeController;
  late TextEditingController locationController;
  late String selectedCountry = 'Syria';
  late String selectedCity = 'Damascus';
  late List<File> selectedimage = [];

  late int categoryId;

  final SendTaskService sendTaskService = SendTaskService();

  void showSuccessSnackbar(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.snackbar(
        "Success",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    });
  }

  void showErrorSnackbar(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.snackbar(
        "Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }

  @override
  Future<bool> submitTask(int contractor_id) async {
    var formdata = formstate88.currentState;

    if (formdata != null && formdata.validate()) {
      try {
        bool isSent = await sendTaskService.sendTask(
          title: titleController.text,
          description: describeController.text,
          location: locationController.text,
          country: selectedCountry,
          city: selectedCity,
          contractorId: contractor_id,
          images: selectedimage,
        );
        if (isSent) {
          showSuccessSnackbar("Task sent successfully");
          await Future.delayed(const Duration(seconds: 1));
          Get.offNamed(AppRoute.CategoryPage,arguments:{'category_id':categoryId});
          return true;
        }
      } catch (e) {
        showErrorSnackbar("An error occurred: $e");
        await Future.delayed(const Duration(seconds: 1));
        print("Error: $e");
        return false;
      }
    }
    return false;
  }

  void selectCountry(String value) {
      selectedCountry = value;
      update();
    }
    void selectCity(String value) {
      selectedCity = value;
      update();
    }

    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedimage.add(File(pickedFile.path));
        update();
      }
    }

    @override
    void onInit() {
      super.onInit();
      titleController = TextEditingController();
      describeController = TextEditingController();
      locationController = TextEditingController();
      final argument=Get.arguments as Map<String,dynamic>;
      categoryId=argument['category_id'];

    }
    @override
    void dispose() {
      titleController.dispose();
      describeController.dispose();
      locationController.dispose();
      super.dispose();
    }
  }