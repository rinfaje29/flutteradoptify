import 'package:adoptify/main.dart';
import 'package:adoptify/screens/auth/signup_screen/signup_controller.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class DetailPage2 extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  DetailPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's Find Your Match",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.08, color: isDarkMode.value ? white : black),
          ),
          30.height,
          Text(
            "What type of animal are you looking to adopt? Don't worry, you can always change this later.",
            style: TextStyle(fontSize: Get.width * 0.04, color: isDarkMode.value ? Colors.white38 : Colors.black45),
          ),
          40.height,
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: controller.pet.length,
              itemBuilder: (BuildContext context, int index) {
                final pet = controller.pet[index];
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedPetIndex.value = index;
                      print(controller.selectedPetIndex.value = index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.selectedPetIndex.value == index ? primaryColor : lightGrey,
                          width: controller.selectedPetIndex.value == index ? Get.width * 0.005 : Get.width * 0.001,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.08,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                pet.image,
                                fit: BoxFit.fill,
                              ).paddingAll(Get.height * 0.01),
                            ),
                          ),
                          Text(
                            pet.name,
                            style: TextStyle(color: isDarkMode.value ? white : black),
                          )
                        ],
                      ),
                    ).paddingAll(Get.height * 0.0065),
                  ),
                );
              },
            ),
          ),
        ],
      ).paddingAll(Get.height * 0.02),
    );
  }
}
