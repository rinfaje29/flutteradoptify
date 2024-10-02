import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/generated/assets.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/profile/help_support/help_support_controller.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/constants.dart';

class FAQ extends StatelessWidget {
  final HelpSupportController _controller = Get.put(HelpSupportController());

  FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Obx(
        () => Text(
          "FAQ",
          style: primaryTextStyle(color: isDarkMode.value ? white : black, weight: FontWeight.bold, size: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: primaryTextStyle(
                color: isDarkMode.value ? white : black,
              ),
              controller: _controller.searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                hintText: 'Search',
                hintStyle: secondaryTextStyle(
                  color: Colors.grey,
                  size: 16,
                  weight: FontWeight.w300,
                ),
                fillColor: context.cardColor,
                filled: true,
                prefixIcon: Image(
                  image: AssetImage(Assets.iconsSearch),
                  color: isDarkMode.value ? grey : Colors.black45,
                  height: 16,
                ).paddingAll(Get.height * 0.015),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ).paddingAll(Get.height * 0.02),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCategoryItem("General"),
                  buildCategoryItem("Account"),
                  buildCategoryItem("Services"),
                  buildCategoryItem("Adoption"),
                ],
              ),
            ),
            20.height,
            listtile(
              context,
              "What is Adoptify?",
              "Adoptify is a platform connecting adopters with pets in local shelters. Browse, apply, and find your perfect furry companion.",
              index: 0,
            ),
            listtile(
              context,
              "How does Adoptify work??",
              "Adoptify is a platform connecting adopters with pets in local shelters. Browse, apply, and find your perfect furry companion.",
              index: 1,
            ),
            listtile(
              context,
              "Is Adoptify a free service?",
              "Adoptify is a platform connecting adopters with pets in local shelters. Browse, apply, and find your perfect furry companion.",
              index: 2,
            ),
            listtile(
              context,
              "How do I apply for adoption?",
              "Adoptify is a platform connecting adopters with pets in local shelters. Browse, apply, and find your perfect furry companion.",
              index: 3,
            ),
            listtile(
              context,
              "Can I adopt from any location?",
              "Adoptify is a platform connecting adopters with pets in local shelters. Browse, apply, and find your perfect furry companion.",
              index: 4,
            ),
            listtile(context, "How do I contact a shelter?", "Adoptify is a platform connecting adopters with pets in local shelters. Browse, apply, and find your perfect furry companion.", index: 5)
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(
    String category,
  ) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _controller.selectCategory(category);
        },
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(Get.height * 0.009),
          height: Get.height * 0.05,
          width: Get.width * 0.25,
          decoration: BoxDecoration(
            color: _controller.selectedCategory.value == category ? primaryColor : null,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isDarkMode.value ? Colors.white24 : Colors.black38,
            ),
          ),
          child: Center(
            child: Text(
              category,
              style: primaryTextStyle(
                color: _controller.selectedCategory.value == category ? white : (isDarkMode.value ? white : black),
                size: 16,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listtile(BuildContext context, String title, String subtitle, {bool isDelete = false, required int index}) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _controller.toggleExpanded(index);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(Get.height * 0.009),
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isDarkMode.value ? Colors.white24 : Colors.black38,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: primaryTextStyle(
                          size: 16,
                          color: isDelete ? cancelStatusColor : (isDarkMode.value ? white : black),
                          weight: FontWeight.bold,
                        ),
                      ),
                      AnimatedRotation(
                        turns: _controller.expandedIndex.value == index ? 0.75 : 0.25,
                        duration: Duration(milliseconds: 200),
                        child: Image(
                          image: NetworkImage("${BaseUrl}/images/adoptify/icons/next.png"),
                          height: 26,
                          color: isDarkMode.value ? white : black,
                        ),
                      ),
                    ],
                  ),
                  if (_controller.expandedIndex.value == index)
                    Divider(
                      color: lightGrey,
                      thickness: 0.1,
                    ),
                  if (_controller.expandedIndex.value == index)
                    Text(
                      subtitle,
                      style: secondaryTextStyle(
                        // size: 19,
                        color: isDarkMode.value ? Colors.white54 : Colors.black54,
                      ),
                    ),
                ],
              ).paddingAll(8),
            ).paddingAll(10),
          ],
        ),
      ),
    );
  }
}
