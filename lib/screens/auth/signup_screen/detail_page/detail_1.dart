import 'package:adoptify/main.dart';
import 'package:adoptify/screens/auth/signup_screen/signup_controller.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class DetailPage1 extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  DetailPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tell us about yourself",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.08, color: isDarkMode.value ? white : black),
          ),
          30.height,
          Text(
            "Are you a Pet Owner or Organization ready to find loving homes? Or a Pet Adopter looking for your new best friend?",
            style: TextStyle(fontSize: Get.width * 0.04, color: isDarkMode.value ? Colors.white38 : Colors.black45),
          ),
          40.height,
          Column(
            children: List.generate(controller.options.length, (index) {
              return Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.selectedOptionIndex.value = index;
                    print(controller.selectedOptionIndex.value = index);
                  },
                  child: Container(
                    height: Get.height * 0.07,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      border: Border.all(
                        color: controller.selectedOptionIndex.value == index ? primaryColor : lightGrey,
                        width: controller.selectedOptionIndex.value == index ? Get.width * 0.005 : Get.width * 0.003,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        controller.options[index].text,
                        style: TextStyle(
                          color: isDarkMode.value ? Colors.white : Colors.black,
                          fontWeight: controller.selectedOptionIndex.value == index ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ).paddingAll(Get.height * 0.02),
    );
  }
}
