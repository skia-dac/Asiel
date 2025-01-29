import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:ShapeCom/domain/controller/wish_list/wish_list_controller.dart';
import 'package:ShapeCom/presentation/components/app-bar/custom_appbar_mab.dart';
import 'package:ShapeCom/presentation/screens/wish_list/widget/wish_list_cart_widget.dart';
import '../../../config/route/route.dart';
import '../../../config/utils/dimensions.dart';
import '../../../config/utils/my_color.dart';
import '../../../config/utils/my_images.dart';
import '../my_cart/widget/slide_menu.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    Get.put(WishListController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<WishListController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBarWithMAB(
          title: MyStrings.wishList,
          isShowBackBtn: true,
          leadingImage: MyImages.backButton,
          actionImage1: MyImages.search,
          actionImage2: MyImages.card,
          actionPress2: () {Get.toNamed(RouteHelper.myCartScreen);},
        ),
        body: ListView(
          children: List.generate(controller.mixProductList.length, (index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.productDetailsScreen2,arguments: controller.mixProductList[index]);
                  },
                  child: SlideMenu(
                    swipeContentWidth: 0.3,
                    menuItems: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.delete,width: Dimensions.space20)
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.card,width: Dimensions.space20,colorFilter: const ColorFilter.mode(MyColor.primaryColor, BlendMode.srcIn),)
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.comparison,width: Dimensions.space20,colorFilter: const ColorFilter.mode(MyColor.iconColor, BlendMode.srcIn),)
                      ),
                    ],
                    child: Container(
                      color: MyColor.colorWhite,
                      child: ListTile(
                        contentPadding: Dimensions.lisTilePaddingHV,
                        title: WishListCartWidget(controller: controller,productModel: controller.mixProductList[index],index: index,),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: double.maxFinite,
                  color: MyColor.colorLightGrey,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
