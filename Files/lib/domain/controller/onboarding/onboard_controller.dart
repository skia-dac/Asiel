import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:ShapeCom/config/utils/my_images.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController{

  int currentIndex = 0;
  PageController pageController = PageController();

  void changeCurrentIndex(int index){
    currentIndex = index;
    update();
  }
  List<String> onboardContentList = [];

  bool isLoading = true;

  List<String> onBoardImage = [];


  List<String> onboardImageList = [
    MyImages.onboardImage_1,
    MyImages.onboardImage_2,
    MyImages.onboardImage_3,
  ];

  List<String> onboardSubTitleList = [
    "Your one-stop destination for all your shopping needs",
    "Unlock exclusive deals and special discounts just for you.",
    "Effortless shopping at your fingertips",
  ];

  List<String> onboardTitleList = [
    "Welcome to ${MyStrings.appName}",
    "Discover deals",
    "Shop smart, shop easy"
  ];
}