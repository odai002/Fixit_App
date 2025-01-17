import 'dart:io';
import 'package:fixit/Controller/Contractor/add_protfilio.dart';
import 'package:fixit/Controller/HomeOnwer/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Widgets/Custom_Bottom_naf_Bar.dart';

class ProfilePage extends StatelessWidget {
  AddProtfilio controller =AddProtfilio();
  ProfilePage({super.key});

  // Static content variables
  final String profession = "132".tr;
  final String descriptionHint = "135".tr;
  final String reviewTitle = "136".tr;
  final double overallRating = 4.5;

  // Review content
  final String reviewerName = "137".tr;
  final double reviewerRating = 3.5;
  final String reviewDate = "138".tr;
  final String reviewDescription = "139".tr;

  // Image list
  final RxList<XFile> images = <XFile>[].obs; // Stores images selected from the gallery

  // Custom color
  final Color primaryColor = const Color(0xff6A3BA8); // Updated purple color

  // Function to pick images from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      images.add(pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    ProfileController controller=Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            Icon(Icons.location_on, color: primaryColor),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${controller.country.value} / ${controller.city.value} / ${controller.streetAddress.value}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image grid with add button
                Obx(
                      () => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: images.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.add, color: primaryColor, size: 40),
                          ),
                        );
                      }
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(images[index - 1].path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () {
                                images.removeAt(index - 1);
                              },
                              child: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // User details
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, size: 40, color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.username}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          profession,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16, color: primaryColor),
                            const SizedBox(width: 4),
                            Text("${controller.phone}"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email, size: 16, color: primaryColor),
                            const SizedBox(width: 4),
                            Text("${controller.email}"),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.edit, color: primaryColor),
                      onPressed: () {
                        // Edit profile functionality
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Description
                Text("140".tr, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: descriptionHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
                // Reviews section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          reviewTitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: List.generate(
                            5,
                                (i) => Icon(
                              Icons.star,
                              size: 16,
                              color: i < overallRating.floor() ? Colors.yellow : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // See more reviews
                      },
                      child: Text("140".tr),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Single Review
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                  title: Text(reviewerName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                              (i) => Icon(
                            Icons.star,
                            size: 16,
                            color: i < reviewerRating.floor() ? Colors.yellow : Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(reviewDescription),
                    ],
                  ),
                  trailing: Text(reviewDate),
                ),
              ],
            ),
          ),
        ),
      ),
/*
      bottomNavigationBar: SnackBarBody(),
*/
    );
  }
}
