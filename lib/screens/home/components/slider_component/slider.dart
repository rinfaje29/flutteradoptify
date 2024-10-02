import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/constants.dart';
import 'slider_controller.dart';

class SliderWidget extends StatelessWidget {
  final SliderController sliderController = Get.put(SliderController());

  SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.26,
      child: Stack(
        children: [
          Container(
            height: Get.height * 0.26,
            child: CarouselSlider.builder(
              itemCount: sliderController.imageList.length,
              options: CarouselOptions(
                height: Get.height * 0.19,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  sliderController.currentindex.value = index;
                },
              ),
              carouselController: sliderController.carouselController,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  height: Get.height * 0.26,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        "${BaseUrl}/images/adoptify/icons/background.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.all(Get.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LimitedBox(
                                  maxWidth: Get.width * 0.45,
                                  child: Text(
                                    sliderController.imageList[index].title,
                                    style: primaryTextStyle(
                                      color: Colors.white,
                                      size: 25,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                LimitedBox(
                                  maxWidth: Get.width * 0.45,
                                  child: Text(
                                    sliderController.imageList[index].description,
                                    style: secondaryTextStyle(
                                      color: Colors.white,
                                      size: 16,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Image.network(
                              sliderController.imageList[index].image,
                              height: 180,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).paddingAll(Get.height * 0.002);
              },
            ),
          ),
          Positioned(
            top: Get.height * 0.23,
            bottom: Get.height * 0.02,
            right: Get.width * 0.4,
            left: Get.width * 0.4,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: sliderController.imageList
                    .asMap()
                    .entries
                    .map(
                      (entry) => GestureDetector(
                        onTap: () => sliderController.carouselController.animateToPage(entry.key),
                        child: Container(
                          width: sliderController.currentindex.value == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: sliderController.currentindex.value == entry.key ? (isDarkMode.value ? primaryColor : primaryColor) : (isDarkMode.value ? white : grey),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    ).paddingSymmetric(
      vertical: Get.height * 0.01,
      horizontal: Get.width * 0.04,
    );
  }
}
