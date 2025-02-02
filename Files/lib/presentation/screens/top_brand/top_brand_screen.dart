import 'package:flutter/material.dart';
import 'package:ShapeCom/config/utils/dimensions.dart';
import 'package:ShapeCom/domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:ShapeCom/domain/controller/top_brand/top_brand_controller.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/top_brand_section.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/route/route.dart';
import '../../../config/utils/my_images.dart';
import '../../../config/utils/my_strings.dart';
import '../../../domain/controller/my_cart/my_cart_controller.dart';
import '../../components/app-bar/custom_appbar_mab.dart';
class TopBrandScreen extends StatefulWidget {
  const TopBrandScreen({super.key});

  @override
  State<TopBrandScreen> createState() => _TopBrandScreenState();
}

class _TopBrandScreenState extends State<TopBrandScreen> {

  @override
  void initState() {
    final controller = Get.put(TopBrandController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TopBrandController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBarWithMAB(
          title: MyStrings.topBrand,
          isShowBackBtn: true,
          leadingImage: MyImages.backButton,
          actionImage1: MyImages.search,
          actionImage2: MyImages.card,
          actionPress1: () {},
          actionPress2: () {
            Get.toNamed(RouteHelper.myCartScreen);
          },
        ),
        body: const TopBrandSection(
          numberOfBrand: 16,
          topPadding: Dimensions.space14,
          rightPadding: Dimensions.space15,
        ),
      )
    );
  }
}
