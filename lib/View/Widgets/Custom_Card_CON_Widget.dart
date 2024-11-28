import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../Controller/Contractor/homepage_contractor_controller.dart';
import '../../data/data_source/Remote/contractor/task_service.dart';
import 'Custom_Button.dart';
import 'Custom_Star_widget.dart'; // Add the StarWidget import

class CustomCardCON extends StatelessWidget {
  final Image image;
  final String name;
  final String email;
  final String desc;
  final String number;
  final String category;
  final String local;
  final int taskId;
  final Function() onViewTask;

  const CustomCardCON({
    super.key,
    required this.image,
    required this.email,
    required this.desc,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
    required this.onViewTask,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    ContractorHomeController controller = Get.find();
    TasksContractorService tasksContractorService = TasksContractorService();

    return InkWell(
      onTap: () {
        // Navigate to the detailed task page
        onViewTask();
      },
      child: Card(
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar Image
                  ClipOval(
                    child: Image.asset(
                      'assets/U.png', // Use the passed image asset
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name and Rating in one row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: GoogleFonts.libreCaslonText(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8),
                            const StarDisplayWidget(
                              filledStar: Icon(Icons.star, color: Colors.yellow, size: 11),
                              unfilledStar: Icon(Icons.star, color: Colors.grey, size: 11),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text(
                          category,
                          style: GoogleFonts.libreCaslonText(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              // Description and Task Action Button Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    fontSize: 8,
                    width: 80,
                    height: 40,
                    textcolor: 0xffffffff,
                    backgroundColor: const Color(0xFF6A3BA8),
                    onPressed: () async {
                      try {
                        await tasksContractorService.acceptTask(taskId);
                      } catch (e) {
                        Get.snackbar("Error", "Failed to accept task: $e");
                      }
                    },
                    text: "Accept", // Button text for accepting the task
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      desc,
                      style: GoogleFonts.libreCaslonText(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              // Bottom Row with Location, Email, and Phone
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Icons.location_on, size: 10, color: Color(0xFF6A3BA8)),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            local,
                            style: GoogleFonts.libreCaslonText(
                              fontSize: 8,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Icons.email, size: 10, color: Color(0xFF6A3BA8)),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            email,
                            style: GoogleFonts.libreCaslonText(
                              fontSize: 8,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Icons.phone, size: 10, color: Color(0xFF6A3BA8)),
                        SizedBox(width: 4),
                        Text(
                          number,
                          style: GoogleFonts.libreCaslonText(
                            fontSize: 8,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
