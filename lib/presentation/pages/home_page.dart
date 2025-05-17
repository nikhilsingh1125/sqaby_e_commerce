import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sqaby_e_commerce/core/res/app_colors.dart';
import 'package:sqaby_e_commerce/presentation/widgets/header_widget/search_widget.dart';

import '../controllers/home_controllers/home_controller.dart';
import '../widgets/header_widget/banner_widget.dart';
import '../widgets/header_widget/comman_text_heading.dart';
import '../widgets/header_widget/header_widget.dart';
import '../widgets/header_widget/menu_items_widgets.dart';
import '../widgets/header_widget/popular_category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.yellow,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    controller = Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250.h,
                decoration: BoxDecoration(
                  color: AppColor.yellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeaderWidget(),
                            SizedBox(height: 16.h),
                            const SearchBarWidget(),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 16.w,
                        right: 16.w,
                        bottom: -50.h,
                        child: const PromoBannerWidget(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextHeading(heading: 'Popular Category'),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Obx(
                () => SizedBox(
                  height: 130.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    itemCount: controller.items.length,
                    separatorBuilder: (context, index) => SizedBox(width: 18.w),
                    itemBuilder: (context, index) {
                      final item = controller.items[index];
                      return PopularCategoryCard(item: item);
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CommonTextHeading(heading: 'Menu'),
              ),
              SizedBox(height: 40.h),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: controller.menuItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.menuItems[index];
                      return MenuItemCard(
                        item: item,
                        onAddTap: () {
                          controller.addToCart(index);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
