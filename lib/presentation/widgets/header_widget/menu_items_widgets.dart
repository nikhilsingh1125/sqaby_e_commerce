import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/res/app_colors.dart';
import '../../../core/res/ui_helper.dart';
import '../../../data/models/menu_itmes.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItems item;
  final VoidCallback onAddTap;

  const MenuItemCard({
    super.key,
    required this.item,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 200.w,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Container(
              height: 180.h,
              padding: EdgeInsets.fromLTRB(12.w, 90.h, 12.w, 12.h),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: customTextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      RatingBarIndicator(
                        rating: item.rating,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 10.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (item.quantity > 1) {
                                item.quantity--;
                                print("Decreased quantity for ${item.name}");
                              }
                            },
                            borderRadius: BorderRadius.circular(20.r),
                            splashColor: AppColor.yellow.withOpacity(0.3),
                            child: const Icon(Icons.remove, size: 16),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(() => Text(
                              '${item.quantity.value}',
                              style: customTextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.black,
                              ),
                            )),
                          ),

                          InkWell(
                            onTap: () {
                              item.quantity++;
                              print("Increased quantity for ${item.name}");
                            },
                            borderRadius: BorderRadius.circular(20.r),
                            splashColor: AppColor.yellow.withOpacity(0.3),
                            child: const Icon(Icons.add, size: 16),
                          ),


                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Obx(() => Text(
                          '₹${(item.price * item.quantity.value).toStringAsFixed(2)}',
                          style: customTextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h,),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        onAddTap();
                        if (kDebugMode) {
                          print("Add button tapped for ${item.name}");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColor.yellow,
                        ),
                        padding: const EdgeInsets.all(4),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add, size: 16),
                              SizedBox(width: 4.h,),
                              Text("Add to Cart",style:customTextStyle(fontSize: 13),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -30.h,
          left: 18.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              item.image,
              width: 140.w,
              height: 120.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}