import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/generated/assets.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/home/blog/blogs_screen.dart';
import 'package:adoptify/screens/home/components/near_by_pets_component/pets_nearby.dart';
import 'package:adoptify/screens/home/components/slider_component/slider.dart';
import 'package:adoptify/screens/home/home_controller.dart';
import 'package:adoptify/screens/notification_screen/notification.dart';
import 'package:adoptify/screens/search_screen/search.dart';
import 'package:adoptify/screens/select_pets_category/select_pet.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController controller = Get.put(HomeScreenController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return controller.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        leadingWidget: Image(
          image: NetworkImage("${BaseUrl}/images/adoptify/image/adoptify.png"),
          color: primaryColor,
          height: 30,
        ).paddingOnly(left: Get.width * 0.02),
        isCenterTitle: true,
        appBarTitle: Obx(
          () => Text(
            "Adoptify",
            style: primaryTextStyle(color: isDarkMode.value ? white : black, weight: FontWeight.bold, size: 18),
          ),
        ),
        actions: [
          Obx(
            () => GestureDetector(
              onTap: () {
                Get.to(() => Search());
              },
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: isDarkMode.value ? Colors.white24 : Colors.black38), shape: BoxShape.circle),
                child: Image(
                  image: AssetImage(Assets.iconsSearch),
                  height: 18,
                  color: isDarkMode.value ? Colors.white70 : Colors.black87,
                ).paddingAll(Get.height * 0.008),
              ),
            ),
          ),
          10.width,
          Obx(
            () => GestureDetector(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: isDarkMode.value ? Colors.white24 : Colors.black26), shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/icons/notification-bell.png"),
                      height: 18,
                      color: isDarkMode.value ? Colors.white70 : Colors.black87,
                    ).paddingAll(8),
                  ),
                  Positioned(
                    top: 10,
                    bottom: 20,
                    right: 4,
                    left: 12,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ).paddingOnly(right: Get.width * 0.04),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SliderWidget(),
              SelectPetsCatagory(),
              NearByPets(),
              Container(height: Get.height * 0.75, child: Blogs(items: [])),
            ],
          ),
        ),
      ),
    );
  }
}
