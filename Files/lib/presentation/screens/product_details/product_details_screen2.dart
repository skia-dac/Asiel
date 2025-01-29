import 'package:ShapeCom/config/utils/my_color.dart';
import 'package:ShapeCom/config/utils/style.dart';
import 'package:ShapeCom/domain/controller/cart_controller/cartController.dart';
import 'package:ShapeCom/domain/controller/product_details/product_details_controller.dart';
import 'package:ShapeCom/presentation/components/app-bar/custom_appbar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/route/route.dart';
import '../../../config/utils/dimensions.dart';
import '../../../config/utils/my_images.dart';
import '../../../config/utils/my_strings.dart';
import '../../../domain/product/my_product.dart';
import '../../components/custom_rating_widget.dart';
import '../../components/custom_read_more.dart';
import '../bottom_nav_section/home/widget/custom_product_section.dart';

class ProductDetailsScreen2 extends StatefulWidget {

  final ProductModel productModel;

  const ProductDetailsScreen2({super.key, required this.productModel});

  @override
  State<ProductDetailsScreen2> createState() => _ProductDetailsScreen2State();
}

class _ProductDetailsScreen2State extends State<ProductDetailsScreen2> {

  @override
  void initState() {
    final controller = Get.put(ProductDetailsController());
    controller.loadImage(widget.productModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (controller) => Scaffold(
        appBar: const CustomAppBar(
        title: MyStrings.productDetails,
        leadingImage: MyImages.backButton,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColor.primaryColor.withOpacity(.07)
                          ),
                          child: Column(
                            children: [
                              CarouselSlider(
                                items: controller.modelImageList.map((e) => Image.asset(e.image)).toList(),
                                options: CarouselOptions(
                                  aspectRatio:1,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 2),
                                  viewportFraction: 1.0,
                                  height: context.height * .38,
                                  enableInfiniteScroll: true,
                                  onPageChanged: (index, reason) {
                                    controller.setCurrentIndex(index);
                                  },
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (index) => Container(
                                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space8),
                                  margin: const EdgeInsets.only(right: Dimensions.space10),
                                  width: controller.currentIndex == index ? 20 : 10,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: controller.currentIndex == index ? MyColor.primaryColor : MyColor.bodyTextColor,
                                    borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                                  ),
                                )),
                              ),
                              const SizedBox(height: 10)
                            ],
                          ),
                        ),

                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              controller.toggleFavorite();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: MyColor.colorWhite,
                              ),
                              child: SvgPicture.asset(controller.isFavorite ? MyImages.wishList : MyImages.wishListOutline,colorFilter: const ColorFilter.mode(MyColor.primaryColor, BlendMode.srcIn),),
                            ),
                          )
                        )
                      ],
                    ),

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.productModel.title,style: boldLarge,maxLines: 1,),
                            Text(widget.productModel.brand,style: regularLarge.copyWith(color: MyColor.naturalDark),),

                            const SizedBox(height: 8,),

                            const CustomRatingWidget()

                          ],
                        ),
                        Column(
                          children: [
                            Text("\$${(int.tryParse(widget.productModel.price)?? 1000 ) + 200}",style: boldLarge.copyWith(decoration: TextDecoration.lineThrough,color: MyColor.canceledTextColor,)),
                            Text("\$${widget.productModel.price}",style: mediumOverLarge,),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(height: 20,),

                    CustomReadMoreText(
                      '${widget.productModel.description ?? ''} ',
                      trimLines: 4,
                      colorClickableText: MyColor.primaryColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: MyStrings.seeMore.tr,
                      trimExpandedText: MyStrings.seeLess.tr,
                      moreStyle:regularLarge.copyWith(color: MyColor.primaryColor,fontWeight: FontWeight.w600),
                      lessStyle: regularLarge.copyWith(color: MyColor.colorGreen,fontWeight: FontWeight.w600),
                      style: regularLarge.copyWith(color: MyColor.bodyTextColor)
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(MyStrings.color,style: mediumLarge,),
                            const SizedBox(width: 15,),
                            Row(
                              children: List.generate(3, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.setSelectedColor(index);
                                  },
                                  child: Container(
                                    height: 25 ,
                                    width: 25 ,
                                    margin: const EdgeInsets.only(right: 6),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.selectColorIndex == index ? MyColor.naturalLight.withOpacity(.4) : Colors.transparent,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(9),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: controller.productColor[index],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.decreaseQuantity();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColor.bodyTextColor,
                                    border: Border.all(color: MyColor.colorWhite,width: 3)
                                ),
                                child: const Icon(Icons.remove,size: 14,color: MyColor.colorWhite,),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Text("${controller.quantity}",style: mediumLarge.copyWith(color: MyColor.bodyTextColor),),
                            ),

                            GestureDetector(
                              onTap: () {
                                controller.increaseQuantity();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColor.bodyTextColor,
                                    border: Border.all(color: MyColor.colorWhite,width: 3)
                                ),
                                child: const Icon(Icons.add,size: 14,color: MyColor.colorWhite,),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),


                  ],
                ),
              ),

              const SizedBox(height: 20),

              CustomProductSection(
                productList: MyProduct.shoeList.reversed.toList(),
                controller: Get.find(),
                productType: MyStrings.relatedProduct.tr,
              ),
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
          child: Row(
            children: [

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.find<CartCountController>().manageCartCount();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.primaryColor,
                        shadowColor: MyColor.transparentColor,
                        padding:  const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                        textStyle: const TextStyle(color: MyColor.colorWhite, fontSize: 14, fontWeight: FontWeight.w500)),
                    child: Text(
                      MyStrings.addToCart.tr,
                      style: const TextStyle(color: MyColor.colorWhite),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.myCartScreen);
                },
                child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColor.primaryColor.withOpacity(.2),
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
                          child: SvgPicture.asset(MyImages.cart),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}