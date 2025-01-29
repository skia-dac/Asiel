import 'package:get/get.dart';
import 'package:ShapeCom/config/route/route.dart';

class SplashController extends GetxController  {
  

  bool isLoading = true;
  gotoNextPage() async {

    Future.delayed(const Duration(seconds: 3),() {
      Get.toNamed(RouteHelper.onboardScreen);
    });

  }

  bool noInternet=false;

}
