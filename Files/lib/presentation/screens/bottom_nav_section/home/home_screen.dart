import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/utils/dimensions.dart';
import 'package:ShapeCom/config/utils/my_color.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:ShapeCom/domain/controller/home/home_controller.dart';
import 'package:ShapeCom/domain/product/my_product.dart';
import 'package:ShapeCom/presentation/components/stataus_bar_color_widget.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/category_section.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/custom_product_section.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/custom_row_header.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/custom_slider.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/gridview_product_widget.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/home_screen_top_section.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/product_card.dart';
import 'package:ShapeCom/presentation/screens/bottom_nav_section/home/widget/summer_offer_heading.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    final controller = Get.put(HomeController());
    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      builder: (controller) =>StatusBarColorWidget(
        color: MyColor.colorWhite,
        iconBrightness: Brightness.dark,
        child: Scaffold(
          backgroundColor: MyColor.colorLightGrey,

          key: scaffoldKey,
            body: SafeArea(
              child: Column(
                children: [

                  const HomeScreenTopSection(),
                  const SizedBox(height: 8),

                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: MyColor.colorWhite,
                          borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            const CategorySection(),

                            CustomProductSection(
                              controller: controller,
                              productType: MyStrings.mostPopular.tr,
                              productList: MyProduct.mixProductList,
                            ),

                            CustomSlider(bannerList: MyProduct.bannerList),

                            // CustomRowHeader(title: MyStrings.supperSell.tr,viewAllPress: () {}),
                            // ProductList(controller: controller,productList: MyProduct.mixProductList.reversed.toList(),),

                            CustomProductSection(
                              productList: MyProduct.mixProductList,
                              controller: controller,
                              productType: MyStrings.topSellingProduct.tr,
                              enableDiscount: true,
                            ),

                            CustomProductSection(
                              productList: MyProduct.mixProductList.reversed.toList(),
                              controller: controller,
                              productType: MyStrings.brandNewProduct.tr,
                            ),

                            // const CategorySection(categoryType: MyStrings.popularCategory),

                            CustomRowHeader(title: MyStrings.relevantProduct.tr,viewAllPress: () {}),
                            GridViewProductWidget(physics: const NeverScrollableScrollPhysics(),productModelList: MyProduct.mixProductList),
                            const SizedBox(height: Dimensions.space8,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
      )
    );
  }
}