import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Core/constant/link_api.dart';
import 'package:fixit/View/Contractor/TaskPage/Controller/TaskPageContractorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskPageContractor extends StatelessWidget {
  const TaskPageContractor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Task".tr,
          style: TextStyles.title,
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Consumer<TaskPageContractorController>(
          builder: (context, controller, child) => controller.isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(32.2),
                  children: [
                    const SizedBox(height: 13),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "22".tr,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(width: 12),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: controller.task!.title,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 23),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "24".tr,
                                  style: GoogleFonts.getFont(
                                    'Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          const SizedBox(height: 22),
                          Container(
                            height: 220,
                            width: 400,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 12,
                                      spreadRadius: 0.5,
                                      offset: Offset.fromDirection(90))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 22, top: 22, right: 14, bottom: 14),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: controller.task!.description!,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 33),
                    Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "28".tr,
                            style: GoogleFonts.getFont(
                              'Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Wrap(
                              children:
                                  controller.task!.taskImage!.map((imageUrl) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    width: 100,
                                    height: 100,
                                    imageUrl:
                                        '${AppLink.Category}task_images/${imageUrl.image!.name}',
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    // errorWidget: (context, url, error) {
                                    //   return Container(
                                    //     color: Colors.grey[300],
                                    //     child: const Icon(
                                    //         Icons.broken_image,
                                    //         color: Colors.red),
                                    //   );
                                    // },
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 33),
                    Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "128".tr,
                            style: GoogleFonts.getFont(
                              'Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 12,
                                    spreadRadius: 0.5,
                                    offset: Offset.fromDirection(90))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: controller.task!.country!,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 12,
                                      spreadRadius: 0.5,
                                      offset: Offset.fromDirection(90))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: controller.task!.city!,
                                      style: GoogleFonts.getFont(
                                        'Libre Caslon Text',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 33),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 50,
                        width: 400,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 12,
                                  spreadRadius: 0.5,
                                  offset: Offset.fromDirection(90))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 22, right: 12, top: 15),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: controller.task!.location,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 50),
                    // if (controller.status == null)
                    // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //   Flexible(
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //       child: ElevatedButton(
                    //         onPressed: () {
                    //           controller.AcceRejContract(
                    //               controller.id!, true);
                    //         },
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor: const Color(0xff6A3BA8),
                    //           side: const BorderSide(color: Color(0xff6A3BA8)),
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           padding: EdgeInsets.symmetric(
                    //             vertical: screenHeight * 0.01,
                    //             horizontal: screenWidth * 0.02,
                    //           ),
                    //         ),
                    //         child: FittedBox(
                    //           child: Text(
                    //             'Accept',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: screenWidth * 0.04,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   Flexible(
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //       child: ElevatedButton(
                    //         onPressed: () {
                    //           controller.AcceRejContract(
                    //               controller.id!, false);
                    //         },
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor: Colors.white,
                    //           side: const BorderSide(color: Color(0xff6A3BA8)),
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           padding: EdgeInsets.symmetric(
                    //             vertical: screenHeight * 0.01,
                    //             horizontal: screenWidth * 0.02,
                    //           ),
                    //         ),
                    //         child: FittedBox(
                    //           child: Text(
                    //             "Reject",
                    //             style: TextStyle(
                    //               color: const Color(0xff6A3BA8),
                    //               fontSize: screenWidth * 0.04,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   )
                    // ]),
                    // if (controller.status == 0)
                    //   Text(
                    //       "The contract is rejected, wait contractor to send other contarct"),
                    // if (controller.status == 1)
                    //   Text(
                    //       "The contract is accepted, wait contractor to finish task and send reciept")
                  ],
                )),
    );
  }
}
