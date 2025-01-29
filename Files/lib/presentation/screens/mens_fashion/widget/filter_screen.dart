import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/presentation/screens/mens_fashion/widget/price_range_section.dart';
import 'package:ShapeCom/presentation/screens/mens_fashion/widget/size_section.dart';
import 'package:ShapeCom/presentation/screens/mens_fashion/widget/title_text.dart';

import '../../../../config/route/route.dart';
import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/mens_fashion/mens_fashion_controller.dart';
import '../../../components/app-bar/custom_appbar_mab.dart';
import '../../../components/buttons/rounded_button.dart';
import '../../../components/divider/custom_divider.dart';
import 'brand_section.dart';
import 'color_section.dart';
import 'mens_fashion_section.dart';
class FilterScreen extends StatelessWidget {


  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MensFashionController>(
      builder: (controller) =>Scaffold(
        appBar: CustomAppBarWithMAB(
          title: MyStrings.filter,
          isShowBackBtn: true,
          leadingImage: MyImages.backButton,
          actionImage1: MyImages.search,
          actionPress2: () {},
        ),
        body:  SafeArea(
          child: Container(
            height: double.maxFinite,
            color: MyColor.colorWhite,
            child: ListView(
              padding: Dimensions.filterDrawerPadding,
              children: [
                Text(MyStrings.categories.tr,style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: Dimensions.space21),
                const TitleText(title: MyStrings.electronics),
                const SizedBox(height: Dimensions.space18),
                MensFashionSection(controller: controller),
                const TitleText(title: MyStrings.healthAndBeauty),
                const SizedBox(height: Dimensions.space20),
                const TitleText(title: MyStrings.babysFashion),
                const SizedBox(height: Dimensions.space20),
                const TitleText(title: MyStrings.weddingsAndEvents),
                const CustomDivider(dividerHeight: 1,space: Dimensions.space34),
                BrandSection(controller: controller),
                const CustomDivider(dividerHeight: 1,space: Dimensions.space34),
                ColorSection(controller: controller),
                const CustomDivider(dividerHeight: 1,space: Dimensions.space34),
                SizeSection(controller: controller),
                const CustomDivider(dividerHeight: 1,space: Dimensions.space34),
                PriceRangeSection(controller: controller),
                const SizedBox(height: Dimensions.space50),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RoundedButton(
            press: () {
              Get.back();
            },
            text: MyStrings.apply.tr,
          ),
        ),
      ),
    );
  }
}


