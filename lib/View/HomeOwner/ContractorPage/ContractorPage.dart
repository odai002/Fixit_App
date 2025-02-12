import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/HomeOwner/ContractorPage/Controller/ContractorPageController.dart';
import 'package:fixit/View/HomeOwner/Portfolio/Controller/PortfolioPageController.dart';
import 'package:fixit/View/HomeOwner/Portfolio/PortfolioPage.dart';
import 'package:fixit/View/Widgets/Custom_App_bar.dart';
import 'package:fixit/View/Widgets/Custom_Star_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ContractorsPage extends StatelessWidget {
  const ContractorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: '13'.tr,
      ),
      // bottomNavigationBar: SnackBarBody(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20),
          //   child: SortingSegmentedControl(
          //     title: '14'.tr,
          //     buttonCaption: '15'.tr,
          //     onSelectionChanged: (int index) => controller.filterItems(index),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 5),
          //   child: SortingSegmentedControl(
          //     title: '16'.tr,
          //     buttonCaption: '17'.tr,
          //     onSelectionChanged: (int index) =>
          //         controller.sortContractors(ascending),
          //   ),
          // ),
          Expanded(
            child: Consumer<ContractorPageController>(
                builder: (context, controller, child) {
              if (controller.isLoading) {
                Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                Center(child: Text("213".tr));
              }
                  return ListView.builder(
                      padding: const EdgeInsets.all(25.0),
                      itemCount: controller.listcontractor.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            CustomRoute.RouteTo(
                                context,
                                ChangeNotifierProvider(
                                  create: (context) => PortfolioPageController()
                                    ..GetProtfilioContractor(
                                        controller.listcontractor[index].id!),
                                  builder: (context, child) => PortfolioPage(),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    BorderRadius.circular(100),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 8,
                                                    spreadRadius: 2,
                                                    offset:
                                                        Offset.fromDirection(
                                                            90),
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                                child: Image.asset(
                                                  'assets/U.png',
                                                  fit: BoxFit.cover,
                                                  width: 45,
                                                  height: 45,
                                                ),
                                              ),
                                            ),
                                            Gap(10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            controller
                                                                .listcontractor[
                                                                    index]
                                                                .username!,
                                                            style: TextStyles
                                                                .pramed),
                                                      ),
                                                      Gap(5),
                                                      Expanded(
                                                        child: Text(
                                                            controller
                                                                .listcontractor[
                                                                    index]
                                                                .category!,
                                                            style: TextStyles
                                                                .smallpra
                                                                .copyWith(
                                                                    fontSize:
                                                                        9.sp)),
                                                      )
                                                    ],
                                                  ),
                                                  Gap(5),
                                                  Text(
                                                    controller
                                                            .listcontractor[
                                                                index]
                                                            .description ??
                                                        '',
                                                    style: TextStyles.smallpra
                                                        .copyWith(
                                                            fontSize: 10.sp),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      StarDisplayWidget(
                                        value: controller.listcontractor[index]
                                            .averageRating!,
                                        filledStar: Icon(Icons.star,
                                            color: AppColors.starcolorreview,
                                            size: 11),
                                        unfilledStar: Icon(Icons.star,
                                            color: AppColors.grey200, size: 11),
                                      )
                                    ],
                                  ),
                                  Gap(10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller.ToSendTaskPage(
                                            context,
                                            controller
                                                .listcontractor[index].id!),
                                        child: Container(
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xff6A3BA8),
                                              ),
                                              color: AppColors.active,
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 0.5,
                                                    spreadRadius: 0.5,
                                                    offset:
                                                        Offset.fromDirection(
                                                            90))
                                              ]),
                                          padding: EdgeInsets.all(8),
                                          child: Center(
                                            child: Text(
                                              controller.listcontractor[index]
                                                      .hasTask!
                                                  ? "Hire Again"
                                                  : "Hire Now",
                                              style: TextStyles.button
                                                  .copyWith(fontSize: 9.sp),
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
                                                "${controller.listcontractor[index].city!}-${controller.listcontractor[index].country!}-${controller.listcontractor[index].address!}",
                                                style: TextStyles.smallpra
                                                    .copyWith(fontSize: 9.sp),
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
                                                controller.listcontractor[index]
                                                    .email!,
                                                style: TextStyles.smallpra
                                                    .copyWith(fontSize: 9.sp),
                                              ),
                                            ],
                                          ),
                                          Gap(5),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.phone_android_outlined,
                                                size: 15,
                                              ),
                                              Gap(5),
                                              Text(
                                                controller.listcontractor[index]
                                                    .phone!,
                                                style: TextStyles.smallpra
                                                    .copyWith(fontSize: 9.sp),
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
                    );
            }),
          ),
        ],
      ),
    );
  }
}
