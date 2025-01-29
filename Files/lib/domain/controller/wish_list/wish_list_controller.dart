import 'package:get/get.dart';

import '../../product/my_product.dart';

class WishListController extends GetxController{

  double productPrice = 220.00;

  int totalRating = 214;

  List<ProductModel> mixProductList = [
    ProductModel(title: "High Quality Bag", image: "assets/product/bag/bag (${1}).png",),
    ProductModel(title: "Newly Design Electronics", image: "assets/product/electronics/electronics (${3}).png",),
    ProductModel(title: "Newly Design Fashion", image: "assets/product/mens_fashion/Mens collections (${10}).png",),
    ProductModel(title: "Newly Design Shoes", image: "assets/product/shoes/shoe (9).png",),
    ProductModel(title: "High Quality Bag", image: "assets/product/bag/bag (${7}).png",),
    ProductModel(title: "High Quality Headphone", image: "assets/product/head_phone/headphone (${6}).png",),
    ProductModel(title: "Newly Design Shoes", image: "assets/product/shoes/shoe (10).png",),
    ProductModel(title: "Newly Design Electronics", image: "assets/product/electronics/electronics (${2}).png",),
    ProductModel(title: "High Quality Headphone", image: "assets/product/head_phone/headphone (${2}).png",),
    ProductModel(title: "High Quality Watch", image: "assets/product/watch/watch (${2}).png",),
  ];

}