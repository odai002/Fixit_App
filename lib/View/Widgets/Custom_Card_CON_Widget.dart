import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controller/Contractor/homepage_contractor_controller.dart';
import '../../data/data_source/Remote/contractor/task_service.dart';
import 'Custom_Button.dart';

class CustomCardCON extends StatelessWidget {
  final String name;
  final String email;
  final String number;
  final String local;
  final String category;
  final String desc;
  final int taskId;
  final Function() onViewTask;

  const CustomCardCON({
    super.key,
    required this.name,
    required this.email,
    required this.number,
    required this.local,
    required this.category,
    required this.desc,
    required this.taskId,
    required this.onViewTask, required Image image,
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
                  ClipOval(
                    child: Image.asset(
                      'assets/U.png', // Replace with your image asset
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Name and Task Category
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: GoogleFonts.libreCaslonText(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    category,
                                    style: GoogleFonts.libreCaslonText(
                                      fontSize: 11,
                                      color: Colors.grey[600],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 18,
                              ),
                              onPressed: () async {
                                Get.defaultDialog(
                                  title: "Confirm Delete",
                                  middleText: 'Are you sure you want to delete this task?',
                                  textConfirm: "Yes",
                                  textCancel: "Cancel",
                                  confirmTextColor: Colors.white,
                                  onConfirm: () async {
                                    try {
                                      await tasksContractorService.deleteTask(taskId);
                                      Get.back();
                                      controller.fetchedTasks();
                                    } catch (e) {
                                      Get.snackbar("Error", "Failed to delete task: $e");
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Description placed below name and category
                        Text(
                          desc,
                          style: GoogleFonts.libreCaslonText(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButton(
                      fontSize: 8,
                      width: 80,
                      height: 40,
                      textcolor: 0xffffffff,
                      backgroundColor: const Color(0xFF6A3BA8),
                      onPressed: () async {
                        try {
                          await tasksContractorService.acceptTask(taskId);
                          controller.fetchedTasks();
                        } catch (e) {
                          Get.snackbar("Error", "Failed to accept task: $e");
                        }
                      },
                      text: "Accept",
                    ),
                  ),
                  const SizedBox(width: 8),

                  Flexible(
                    child: Row(
                      children: [

                        const Icon(Icons.location_on, size: 10, color: Color(0xFF6A3BA8)),
                        const SizedBox(width: 4),
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
                        const Icon(Icons.email, size: 10, color: Color(0xFF6A3BA8)),
                        const SizedBox(width: 4),
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

                        const Icon(Icons.phone, size: 10, color: Color(0xFF6A3BA8)),
                        const SizedBox(width: 4),
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
