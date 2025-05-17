import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import '../../controllers/home_controllers/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.navPages,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: controller.selectedIndex.value,
          height: 60,
          backgroundColor: Colors.transparent,
          color: Colors.orange,
          buttonBackgroundColor: Colors.deepOrange,
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.category, size: 30, color: Colors.white),
            Icon(Icons.search, size: 30, color: Colors.white),
            Icon(Icons.favorite, size: 30, color: Colors.white),
            Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          ],
          onTap: controller.changeTab,
        ),
      );
    });
  }
}
