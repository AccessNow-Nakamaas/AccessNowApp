import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qrpay/controller/buy_giftcard_controller/buy_giftcard_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../widgets/categories_widget/buygift_card_widget.dart';

class BuyGiftCardScreen extends StatelessWidget {
  BuyGiftCardScreen({super.key});

  final controller = Get.put(BuyGiftCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.buyGiftcard),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        InkWell(
            onTap: () {
              controller.ontapCard();
            },
            child: DashboardSlider()),
      ],
    );
  }
}

class DashboardSlider extends StatelessWidget {
  DashboardSlider({Key? key}) : super(key: key);

  final List<Widget> imgList = [
    const BuyGiftCardWidget(),
    const BuyGiftCardWidget(),
    const BuyGiftCardWidget(),
    const BuyGiftCardWidget(),
    const BuyGiftCardWidget(),
    const BuyGiftCardWidget(),
  ];

  final controller = Get.put(BuyGiftCardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          CarouselSlider(
            items: imgList.map((img) {
              return Builder(
                builder: (BuildContext context) {
                  return const BuyGiftCardWidget();
                },
              );
            }).toList(),
            carouselController: controller.carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                controller.current.value = index; //! Custom Dot indicator State
              },
              height: MediaQuery.of(context).size.height * 0.53,
              viewportFraction: 1,
              initialPage: 1,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return controller.current.value == entry.key
                  ? Container(
                      width: Dimensions.widthSize * 1.2,
                      height: Dimensions.heightSize * 0.9,
                      margin: EdgeInsets.symmetric(
                          vertical: Dimensions.marginSize * 0.2,
                          horizontal: Dimensions.marginSize * 0.2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColor.primaryColor,
                      ))
                  : Container(
                      width: Dimensions.widthSize,
                      height: Dimensions.heightSize * 0.7,
                      margin: EdgeInsets.symmetric(
                          vertical: Dimensions.marginSize * 0.2,
                          horizontal: Dimensions.marginSize * 0.2),
                      decoration: BoxDecoration(
                        color: CustomColor.primaryColor.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    );
            }).toList(),
          ),
        ],
      );
    });
  }
}
