import 'package:get/get.dart';

class MenuItems {
  String name;
  double rating;
  double price;
  String image;
  RxInt quantity = 1.obs;

  MenuItems({
    required this.name,
    required this.rating,
    required this.price,
    required this.image,
    int initialQuantity = 1,
  }){
    quantity.value = initialQuantity;
  }
}
