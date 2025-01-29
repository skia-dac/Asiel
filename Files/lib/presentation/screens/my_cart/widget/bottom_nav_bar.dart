import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/route/route.dart';
import 'package:ShapeCom/config/utils/dimensions.dart';
import 'package:ShapeCom/config/utils/my_color.dart';
import 'package:ShapeCom/config/utils/my_images.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:ShapeCom/domain/controller/cart_controller/cartController.dart';
import 'package:ShapeCom/presentation/screens/menu/menu_screen.dart';
import 'package:ShapeCom/presentation/screens/my_order/my_order_screen.dart';
import 'package:ShapeCom/presentation/screens/wish_list/wish_list_screen.dart';
import '../../../../config/utils/style.dart';
import '../../../components/image/custom_svg_picture.dart';
import '../../bottom_nav_section/home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  void initState() {
    Get.put(CartCountController());
    super.initState();
  }

  List<Widget> screens = [
    const HomeScreen(),
    const WishListScreen(),
    const MyOrderScreen(isShowBackButton: false,),
    const MenuScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: screens[currentIndex],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: MyColor.colorWhite,
            elevation: 6,
            shadowColor: MyColor.colorBlack,
            surfaceTintColor: MyColor.transparentColor,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navBarItem(MyImages.home, 0, MyStrings.home),
                navBarItem(MyImages.wishList, 1, MyStrings.favorite.tr),
                const SizedBox(width: 50),
                navBarItem(MyImages.order, 2, MyStrings.order.tr),
                navBarItem(MyImages.menu, 3, MyStrings.menu.tr),
              ],
            ),
          ),

          floatingActionButton: GetBuilder<CartCountController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 65,
                width: 65,
                child: FloatingActionButton(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  hoverColor: MyColor.primaryColor.withOpacity(0.2),
                  shape: const OvalBorder(),
                  onPressed: () async {
                    Get.toNamed(RouteHelper.myCartScreen);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(Dimensions.space20),
                    decoration: BoxDecoration(
                      color: MyColor.colorWhite,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.6,
                          spreadRadius: 0.2,
                          color: MyColor.primaryColor.withOpacity(0.3),
                        )
                      ],
                    ),
                    child: GetBuilder<CartCountController>(
                      builder: (controller) => badges.Badge(
                        showBadge: controller.cartCount > 0,
                        badgeStyle: const badges.BadgeStyle(
                          shape: badges.BadgeShape.circle,
                          badgeColor: MyColor.inProgressTextColor,
                          padding: EdgeInsets.all(5),
                          elevation: 0,
                        ),
                        badgeContent: Text(controller.cartCount.toString(),style: regularSmall.copyWith(fontSize: 8,color: MyColor.colorWhite),),
                        child: SvgPicture.asset(MyImages.cart,width: 65,height: 65,colorFilter: const ColorFilter.mode(MyColor.primaryColor, BlendMode.srcATop),),
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }

  navBarItem(String imagePath, int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space17),
        height: 80,
        color: MyColor.colorWhite,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CustomSvgPicture(
                image: imagePath,
                color: index == currentIndex ? MyColor.primaryColor : MyColor.iconColor.withOpacity(0.8),
                width: 22,
                height: 22,
              ),
            ),
            const SizedBox(height: Dimensions.space3 + 1),
            Text(label.tr, textAlign: TextAlign.center, style: regularSmall.copyWith(color: index == currentIndex ? MyColor.primaryColor : MyColor.iconColor.withOpacity(0.8), fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
