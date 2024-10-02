import 'package:adoptify/main.dart';
import 'package:adoptify/screens/profile/pet_preferences/petpreferences_controller.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/constants.dart';

class PetPreference extends StatelessWidget {
  final PetPreferenceController controller = Get.put(PetPreferenceController());

  PetPreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: Get.height * 0.42,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "My Pet Preferences",
              style: TextStyle(fontSize: 18, color: isDarkMode.value ? white : black),
            ),
            15.height,
            Divider(
              thickness: 0.2,
              height: 0,
            ),
            15.height,
            Wrap(
              children: [
                buildCategoryItem('Cats', "${BaseUrl}/images/adoptify/pets/cat.png"),
                buildCategoryItem('Dogs', "${BaseUrl}/images/adoptify/pets/dog.png"),
                buildCategoryItem('Birds', "${BaseUrl}/images/adoptify/pets/parrot.png"),
                buildCategoryItem('Horses', "${BaseUrl}/images/adoptify/pets/horse.png"),
                buildCategoryItem('Rabbits', "${BaseUrl}/images/adoptify/pets/rabbit.png"),
                buildCategoryItem('Reptiles', "${BaseUrl}/images/adoptify/pets/snake.png"),
                buildCategoryItem('Fish', "${BaseUrl}/images/adoptify/pets/fish.png"),
                buildCategoryItem('Primates', "${BaseUrl}/images/adoptify/pets/monkey.png"),
              ],
            ),
            20.height,
            Divider(
              thickness: 0.2,
              height: 0,
            ),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height * 0.063,
                  width: Get.width * 0.4,
                  child: AppButton(
                    width: Get.width,
                    elevation: 0,
                    text: "Cancel",
                    textStyle: TextStyle(fontSize: Get.width * 0.05, color: isDarkMode.value ? white : primaryColor),
                    color: isDarkMode.value ? Color(0xFF35383F) : primaryColor.withOpacity(0.15),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
                Container(
                  height: Get.height * 0.063,
                  width: Get.width * 0.4,
                  child: AppButton(
                    width: Get.width,
                    elevation: 0,
                    text: "Ok",
                    textStyle: TextStyle(fontSize: Get.width * 0.05, color: white),
                    color: primaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      Get.back();
                    },
                  ),
                )
              ],
            )
          ],
        ).paddingAll(Get.height * 0.02),
      ),
    );
  }

  Widget buildCategoryItem(String category, String imageAsset) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.selectCategory(category);
        },
        child: Container(
          margin: EdgeInsets.all(1),
          padding: EdgeInsets.all(9),
          height: Get.height * 0.05,
          width: Get.width * 0.29,
          decoration: BoxDecoration(
            color: controller.selectedCategory.value == category ? primaryColor : null,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isDarkMode.value ? Colors.white24 : Colors.black26,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imageAsset, height: 30).paddingAll(Get.height * 0.002),
              Text(
                category,
                style: TextStyle(
                  color: isDarkMode.value ? white : black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
