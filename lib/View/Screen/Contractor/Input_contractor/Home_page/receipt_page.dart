import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReceiptPage extends StatefulWidget {
  @override
  _ReceiptPageState createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  // Variables for static data
  final String appBarTitle = 'Receipt';
  final Color appBarTextColor = Colors.black;
  final Color appBarBackgroundColor = Colors.white;

  final String paymentEndDateLabel = 'Payment end Date';
  final String paymentEndDateValue = '2024-12-31';

  final String taskTitleLabel = 'Task Title';
  final String taskTitleValue = 'Repair';

  final String taskDescriptionLabel = 'Task Description';
  final String taskDescriptionValue = 'Repairing the shelf and lights.';

  final String taskPictureLabel = 'Task Picture';
  final List<String> taskPicturePaths = [
    'assets/task_pic_1.jpg',
    'assets/task_pic_2.jpg',
    'assets/task_pic_3.jpg',
  ];

  final String taskPriceLabel = 'Task Price';
  final String taskPriceValue = '\$200';

  final String taskDonePriceLabel = 'Task Done Price';
  final String taskDonePriceValue = '\$180';

  final String taskLocationLabel = 'Task Location';
  final List<String> taskLocationChips = ['Syria', 'Maza'];
  final String taskLocationDetails = 'Street oliver/building52';

  final String addTaskDonePictureLabel = 'Add Task Done Picture';
  final String sendReceiptButtonText = 'Send Receipt';
  final Color sendReceiptButtonColor = Color(0xff6A3BA8);

  // Dynamic variables
  List<XFile?> taskDonePictures = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        taskDonePictures.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appBarTextColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: appBarTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStaticField(paymentEndDateLabel, paymentEndDateValue),
            _buildStaticField(taskTitleLabel, taskTitleValue),
            _buildDescriptionField(taskDescriptionLabel, taskDescriptionValue),
            _buildImageSection(taskPictureLabel, taskPicturePaths),
            _buildStaticField(taskPriceLabel, taskPriceValue),
            _buildStaticField(taskDonePriceLabel, taskDonePriceValue),
            _buildLocationSection(),
            _buildDynamicImageSection(addTaskDonePictureLabel),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: sendReceiptButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                ),
                child: Text(
                  sendReceiptButtonText,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticField(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$label :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                value,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionField(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              value,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(String label, List<String> imagePaths) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: imagePaths
                  .map((path) => Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    path,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$taskLocationLabel :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Row(
            children: taskLocationChips
                .map((location) => Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Chip(
                label: Text(
                  location,
                  style: TextStyle(fontSize: 14.0),
                ),
                backgroundColor: Colors.grey[200],
              ),
            ))
                .toList(),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(taskLocationDetails),
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicImageSection(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(Icons.add, size: 40, color: Colors.black45),
                  ),
                ),
                ...taskDonePictures.map(
                      (image) => Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        File(image!.path),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
