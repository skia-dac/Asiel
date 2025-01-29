import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/utils/my_color.dart';
import 'package:ShapeCom/config/utils/my_images.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:ShapeCom/domain/controller/my_cart/my_cart_controller.dart';
import 'package:ShapeCom/domain/product/my_product.dart';
import 'package:ShapeCom/presentation/screens/my_cart/widget/bottom_section.dart';
import 'package:ShapeCom/presentation/screens/my_cart/widget/cart_widget.dart';
import '../../../config/utils/dimensions.dart';
import '../../../config/utils/style.dart';

class MyCartScreen extends StatefulWidget {

  final bool isShowBackButton;

  const MyCartScreen({super.key,this.isShowBackButton = true});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  @override
  void initState() {
    final controller = Get.put(MyCartController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(
      builder: (controller) => Scaffold(
        backgroundColor: MyColor.colorLightGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(MyStrings.myCart.tr,style: titleText,),
          leading: widget.isShowBackButton ? IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(MyImages.backButton)
          ) : null,
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.mixProductList.length,
          itemBuilder: (context, index) {
          return Container(
            color: MyColor.colorWhite,
            margin: const EdgeInsets.only(bottom: Dimensions.space4),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 4),
              title: CartWidget(controller: controller,productModel: controller.mixProductList[index],),
            ),
          );
        }),
        bottomNavigationBar: widget.isShowBackButton ? BottomSection(controller: controller) : const SizedBox.shrink()
      ),
    );
  }
}






