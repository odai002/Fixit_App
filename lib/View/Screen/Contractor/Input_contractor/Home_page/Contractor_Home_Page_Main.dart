import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixit/Controller/Contractor/homepage_contractor_controller.dart';

import '../../../../Widgets/Custom_App_bar.dart';
import '../../../../Widgets/Custom_Bottom_CON_naf_Bar.dart';
import '../../../../Widgets/Custom_Card_CON_Widget.dart';

class ContractorHomePage extends StatelessWidget {
  const ContractorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ContractorHomeController controller = Get.put(ContractorHomeController());

    return Scaffold(
      bottomNavigationBar: SnackBarBodyCON(),
      appBar: CustomAppBar(title: ''),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 22, left: 12, top: 12),
                  child: Text(
                    "Today",
                    style: GoogleFonts.getFont(
                      'Libre Caslon Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.tasks.isEmpty) {
                    return const Center(child: Text("No tasks available"));
                  } else {
                    return ListView.builder(
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        final task = controller.tasks[index];
                        return CustomCardCON(
                          image: Image.asset('assets/U.png'),
                          email: task['email'] ?? 'Udai suleman@gmaail.com',
                          desc: task['description'],
                          number: task['number'] ?? '09932116554',
                          name: task['name'] ?? "Udai",
                          category: task['title'],
                          local: '${task['country']} / ${task['city']} / ${task['location']}',
                          taskId: task['id'],
                          onViewTask: () {
                            controller.viewTaskDetails(task);
                          },
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
