// ignore_for_file: must_be_immutable

import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/HomeOwner/Portfolio/Controller/PortfolioPageController.dart';
import 'package:fixit/View/HomeOwner/TaskPage/Controller/TaskPageController.dart';
import 'package:fixit/View/HomeOwner/TaskPage/TaskPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioPageController>(
      builder: (context, controller, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.active,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.location_pin,
                color: AppColors.primary,
              ),
              controller.isLoading
                  ? Text(
                      "................",
                      style: TextStyles.paraghraph
                          .copyWith(color: AppColors.active, fontSize: 14.sp),
                    )
                  : Text(
                      "${controller.contractor.city}/${controller.contractor.country}/${controller.contractor.address}",
                      style: TextStyles.paraghraph
                          .copyWith(color: AppColors.active, fontSize: 14.sp),
                    ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) => Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: PageView.builder(
                                controller: _pageController,
                                itemCount: controller
                                    .contractor.portfolioImage!.length,
                                onPageChanged: (int index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      '${AppApi.imageurl}${controller.contractor.portfolioImage![index].name!}',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  controller.contractor.portfolioImage!.length,
                                  (index) {
                                return AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  width: _currentPage == index ? 30 : 10,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: _currentPage == index
                                        ? Color(0xFF59308E)
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                  offset: Offset.fromDirection(90),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.asset(
                                'assets/U.png',
                                fit: BoxFit.cover,
                                width: 75,
                                height: 75,
                              ),
                            ),
                          ),
                          Gap(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.contractor.username!,
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                controller.contractor.category!,
                                style: GoogleFonts.roboto(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.phone,
                                      color: Color(0xFF59308E), size: 10),
                                  SizedBox(width: 4),
                                  Text(controller.contractor.phone!,
                                      style: GoogleFonts.roboto(fontSize: 10)),
                                  SizedBox(width: 16),
                                  Icon(Icons.email,
                                      color: Color(0xFF59308E), size: 10),
                                  SizedBox(width: 4),
                                  Text(controller.contractor.email!,
                                      style: GoogleFonts.roboto(fontSize: 10)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      // Description
                      Text(
                        "140".tr,
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        controller.contractor.description!,
                        style: GoogleFonts.roboto(fontSize: 12),
                      ),
                      SizedBox(height: 24),
                      // Reviews Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "205(${controller.contractor.totalRating})".tr,
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Gap(10),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: index <
                                          controller.contractor.averageRating!
                                      ? AppColors.starcolorreview
                                      : AppColors.grey100,
                                  size: 15.w);
                            })
                              ..add(Gap(10))
                              ..add(Text(
                                  "${controller.contractor.averageRating!}/5")),
                          ),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: Text(
                          //     "See more...",
                          //     style: GoogleFonts.roboto(
                          //         color: Color(0xFF59308E), fontSize: 12),
                          //   ),
                          // ),
                        ],
                      ),

                      SizedBox(height: 16),
                      // Single review
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.contractor.rating!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    offset: Offset.fromDirection(90),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset(
                                  'assets/U.png',
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            title: Text(
                              controller.contractor.rating![index].username!,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(5, (indexx) {
                                    return Icon(Icons.star,
                                        color: indexx <
                                                controller.contractor
                                                    .rating![index].rate!
                                            ? AppColors.starcolorreview
                                            : AppColors.grey100,
                                        size: 15.w);
                                  }),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  controller.contractor.rating![index].comment!,
                                  style: GoogleFonts.roboto(fontSize: 10),
                                ),
                              ],
                            ),
                            // trailing: Text(
                            //   "Today",
                            //   style: GoogleFonts.roboto(
                            //       color: Colors.grey, fontSize: 10),
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      // Hire Now Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Hire action
                            CustomRoute.RouteTo(
                                context,
                                ChangeNotifierProvider(
                                  create: (context) => TaskPageController()
                                    ..initstate(controller.contractor.id!),
                                  builder: (context, child) => TaskPage(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF59308E),
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "19".tr,
                            style: GoogleFonts.roboto(
                                fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
