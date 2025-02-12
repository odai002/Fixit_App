import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Core/function/alert_exit_app.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/Contractor/Contract/ContractPageContractor.dart';
import 'package:fixit/View/Contractor/Contract/Controller/ContractPageContractorController.dart';
import 'package:fixit/View/Contractor/Home/Controller/HomePageContractController.dart';
import 'package:fixit/View/Contractor/Reciept/Controller/RecieptPageContractorController.dart';
import 'package:fixit/View/Contractor/Reciept/RecieptPageContractor.dart';
import 'package:fixit/View/Contractor/TaskPage/Controller/TaskPageContractorController.dart';
import 'package:fixit/View/Contractor/TaskPage/TaskPageContractor.dart';
import 'package:fixit/View/Widgets/Custom_App_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageContractor extends StatelessWidget {
  const HomePageContractor({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageContractorController>(
      builder: (context, controller, child) => Scaffold(
        appBar: CustomAppBar(title: ''),
        body: PopScope(
          onPopInvoked: (didPop) {
            AlertExitApp();
          },
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 22, left: 12, top: 12),
                  child: Text(
                    "155".tr,
                    style: GoogleFonts.getFont(
                      'Libre Caslon Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              RefreshIndicator(
                  onRefresh: () => controller.GetMyTasks(),
                  child: controller.isloading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.listtask.isEmpty
                          ? Center(
                              child: Text("194".tr),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.listtask.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    CustomRoute.RouteTo(
                                        context,
                                        ChangeNotifierProvider(
                                          create: (context) =>
                                              TaskPageContractorController()
                                                ..GetTaskById(controller
                                                    .listtask[index].id!),
                                          builder: (context, child) =>
                                              TaskPageContractor(),
                                        ));
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            blurRadius: 8,
                                                            spreadRadius: 2,
                                                            offset: Offset
                                                                .fromDirection(
                                                                    90),
                                                          ),
                                                        ],
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                        child: Image.asset(
                                                          'assets/U.png',
                                                          fit: BoxFit.cover,
                                                          width: 45,
                                                          height: 45,
                                                        ),
                                                      ),
                                                    ),
                                                    Gap(15),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                    controller
                                                                        .listtask[
                                                                            index]
                                                                        .user!
                                                                        .username!,
                                                                    style: TextStyles
                                                                        .pramed),
                                                              ),
                                                            ],
                                                          ),
                                                          Gap(5),
                                                          Text(
                                                              controller
                                                                  .listtask[
                                                                      index]
                                                                  .title!,
                                                              style: TextStyles
                                                                  .smallpra
                                                                  .copyWith(
                                                                      fontSize:
                                                                          9.sp)),
                                                          Gap(5),
                                                          Text(
                                                            controller
                                                                    .listtask[
                                                                        index]
                                                                    .description ??
                                                                '',
                                                            style: TextStyles
                                                                .smallpra
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              if (controller
                                                      .listtask[index].status ==
                                                  null)
                                                GestureDetector(
                                                    onTap: () =>
                                                        controller.AccRejTask(
                                                            controller
                                                                .listtask[index]
                                                                .id!,
                                                            false),
                                                    child: Icon(Icons.delete))
                                            ],
                                          ),
                                          Gap(10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              controller.listtask[index]
                                                      .is_finish!
                                                  ? Container(
                                                      height: 30.h,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: AppColors
                                                                .grey100,
                                                          ),
                                                          color:
                                                              AppColors.grey100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(11),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                blurRadius: 0.5,
                                                                spreadRadius:
                                                                    0.5,
                                                                offset: Offset
                                                                    .fromDirection(
                                                                        90))
                                                          ]),
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Center(
                                                        child:
                                                            Text("207".tr),
                                                      ),
                                                    )
                                                  : controller.listtask[index]
                                                              .status ==
                                                          0
                                                      ? Container(
                                                          height: 30.h,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: AppColors
                                                                        .grey100,
                                                                  ),
                                                                  color: AppColors
                                                                      .grey100,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              11),
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .grey,
                                                                    blurRadius:
                                                                        0.5,
                                                                    spreadRadius:
                                                                        0.5,
                                                                    offset: Offset
                                                                        .fromDirection(
                                                                            90))
                                                              ]),
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          child: Center(
                                                            child: Text(
                                                                "206".tr),
                                                          ),
                                                        )
                                                      : GestureDetector(
                                                          onTap: () => controller
                                                                  .listtask[
                                                                      index]
                                                                  .is_finish!
                                                              ? null
                                                              : controller
                                                                      .listtask[
                                                                          index]
                                                                      .hasContract!
                                                                  ? CustomRoute
                                                                      .RouteTo(
                                                                          context,
                                                                          ChangeNotifierProvider(
                                                                            create: (context) => RecieptPageContractorController()
                                                                              ..getContractById(controller.listtask[index].contract_id!),
                                                                            builder: (context, child) =>
                                                                                RecieptPageContractor(),
                                                                          ))
                                                                  : controller.listtask[index].status ==
                                                                          1
                                                                      ? CustomRoute
                                                                          .RouteTo(
                                                                              context,
                                                                              ChangeNotifierProvider(
                                                                                create: (context) => ContractPageContractorController()..initstate(controller.listtask[index]),
                                                                                builder: (context, child) => ContractPageContractor(),
                                                                              ))
                                                                      : controller.AccRejTask(
                                                                          controller
                                                                              .listtask[index]
                                                                              .id!,
                                                                          true),
                                                          child: Container(
                                                            height: 30.h,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xff6A3BA8),
                                                                    ),
                                                                    color: AppColors
                                                                        .active,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            11),
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      blurRadius:
                                                                          0.5,
                                                                      spreadRadius:
                                                                          0.5,
                                                                      offset: Offset
                                                                          .fromDirection(
                                                                              90))
                                                                ]),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8),
                                                            child: Center(
                                                              child: Text(
                                                                controller
                                                                        .listtask[
                                                                            index]
                                                                        .is_finish!
                                                                    ? "193".tr
                                                                    : controller
                                                                            .listtask[
                                                                                index]
                                                                            .hasContract!
                                                                        ? "195".tr
                                                                        : controller.listtask[index].status ==
                                                                                1
                                                                            ? "196".tr
                                                                            : "197".tr,
                                                                style: TextStyles
                                                                    .button
                                                                    .copyWith(
                                                                        fontSize:
                                                                            9.sp),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                              Gap(10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.map,
                                                        size: 15,
                                                      ),
                                                      Gap(5),
                                                      Text(
                                                        "${controller.listtask[index].city!}-${controller.listtask[index].country!}-${controller.listtask[index].location!}",
                                                        style: TextStyles
                                                            .smallpra
                                                            .copyWith(
                                                                fontSize: 9.sp),
                                                      ),
                                                    ],
                                                  ),
                                                  Gap(5),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.email,
                                                        size: 15,
                                                      ),
                                                      Gap(5),
                                                      Text(
                                                        controller
                                                            .listtask[index]
                                                            .user!
                                                            .email!,
                                                        style: TextStyles
                                                            .smallpra
                                                            .copyWith(
                                                                fontSize: 9.sp),
                                                      ),
                                                    ],
                                                  ),
                                                  Gap(5),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .phone_android_outlined,
                                                        size: 15,
                                                      ),
                                                      Gap(5),
                                                      Text(
                                                        controller
                                                            .listtask[index]
                                                            .user!
                                                            .phone!,
                                                        style: TextStyles
                                                            .smallpra
                                                            .copyWith(
                                                                fontSize: 9.sp),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ))
            ],
          ),
        ),
      ),
    );
  }
}
