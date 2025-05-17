import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../core/res/icons_assets.dart';
import '../../../core/service/notification_service.dart';
import '../../../data/models/food_category.dart';
import '../../../data/models/menu_itmes.dart';

class HomeController extends GetxController {
  var items = <FoodCategory>[].obs;
  var menuItems = <MenuItems>[].obs;
  final firebaseService = FirebaseService();
  @override
  void onInit() {
    loadItems();
    loadMenuItems();
    super.onInit();
  }

  void loadItems() {
    items.value = [
      FoodCategory(name: 'Chinese Food', image: ImageAsset.item_1),
      FoodCategory(name: 'Itallian Food', image: ImageAsset.item_2),
      FoodCategory(name: 'Mexican Food', image: ImageAsset.item_3),
      FoodCategory(name: 'Chinese Food', image: ImageAsset.item_1),
      FoodCategory(name: 'Itallian Food', image: ImageAsset.item_2),
      FoodCategory(name: 'Mexican Food', image: ImageAsset.item_3),
    ];
  }

  void loadMenuItems() {
    menuItems.value = [
      MenuItems(
          name: 'Dal Makhni',
          rating: 4.5,
          price: 250.00,
          image: ImageAsset.menu1),
      MenuItems(
          name: 'Shahi Paneer',
          rating: 4.5,
          price: 180.00,
          image: ImageAsset.menu2),
      MenuItems(
          name: 'Dal Makhni',
          rating: 4.5,
          price: 250.00,
          image: ImageAsset.menu1),
      MenuItems(
          name: 'Shahi Paneer',
          rating: 4.5,
          price: 180.00,
          image: ImageAsset.menu2),
    ];
  }

  void addToCart(int index) {
    if (kDebugMode) {
      firebaseService.showAddToCartNotification(menuItems[index].name);
      print("Added item to cart: ${menuItems[index].name}");
    }
  }

}
