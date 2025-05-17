import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/res/app_colors.dart';
import '../../../core/res/ui_helper.dart';
import '../../../data/models/food_category.dart';

class PopularCategoryCard extends StatelessWidget {
  final FoodCategory item;

  const PopularCategoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: 110.w,
            height: 100.h,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.yellow,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 5.h),
                child: Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: customTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0.h,
          left: 15.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              item.image,
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}