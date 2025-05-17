import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/res/icons_assets.dart';
import '../../../core/res/ui_helper.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(ImageAsset.boy),
            ),
            SizedBox(
              width: 5.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi Abhishek Sharma',
                    style: customTextStyle(fontSize: 16)),
                Text(
                  'W53Q + V9H, Subash nagar, Jwalapur',
                  style: customTextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        const Icon(
          Icons.notifications_none,
          size: 35,
        ),
      ],
    );
  }
}