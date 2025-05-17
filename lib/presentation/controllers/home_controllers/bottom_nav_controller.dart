import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqaby_e_commerce/presentation/pages/home_page.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }


  final List<Widget> navPages = [
    const HomeScreen(),
    const Center(child: Text('Category')),
    const Center(child: Text('Search')),
    const Center(child: Text('Favorites')),
    const Center(child: Text('Cart')),
  ];

}
