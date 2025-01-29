import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/utils/my_color.dart';
import 'package:ShapeCom/config/utils/style.dart';
import 'package:ShapeCom/config/utils/util.dart';
import 'package:ShapeCom/domain/controller/splash/splash_controller.dart';

import '../../../config/utils/my_images.dart';
import '../../../domain/controller/cart_controller/cartController.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    MyUtils.splashScreen();

    var controller = Get.put(SplashController());
    Get.put(CartCountController());
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.gotoNextPage();
    });
  }

  @override
  void dispose() {
    MyUtils.allScreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: controller.noInternet ? MyColor.colorWhite : MyColor.colorWhite,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(MyImages.splashLogo, height: context.width * .6, width: context.width * .6),
            ),
          ],
        ),
      ),
    );
  }
}
