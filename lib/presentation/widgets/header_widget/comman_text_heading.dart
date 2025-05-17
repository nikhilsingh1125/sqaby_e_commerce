import 'package:flutter/material.dart';

import '../../../core/res/app_colors.dart';
import '../../../core/res/ui_helper.dart';

class CommonTextHeading extends StatelessWidget {
  final String heading;

  const CommonTextHeading({required this.heading, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(heading,
            style: customTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.black)),
        Text(
          'See All',
          style: customTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColor.yellow),
        ),
      ],
    );
  }
}