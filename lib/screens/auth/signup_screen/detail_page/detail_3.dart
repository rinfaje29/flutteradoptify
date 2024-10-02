import 'package:adoptify/screens/auth/signup_screen/signup_controller.dart';
import 'package:adoptify/screens/auth/signup_screen/signup_model.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class DetailPage3 extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  DetailPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Breed Preferences",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width * 0.08,
                  color: isDarkMode.value 
                  ? white 
                  : black),
            ),
            30.height,
            Text(
              "Specify your preferences for the breed of the animal you'd like to adopt. based on your previous choice. Select all that apply.",
              style: TextStyle(
                  fontSize: Get.width * 0.04,
                  color: isDarkMode.value
                   ? Colors.white38 
                   : Colors.black45),
            ),
            40.height,
            Wrap(
              spacing: 10.0, 
              runSpacing: 10.0, 
              children: controller.breeds.map<Widget>((Detail3Model breed) {
                return Obx(
                  () => FilterChip(
                    label: Text(
                      breed.breed,
                      style: TextStyle(
                          color: isDarkMode.value 
                          ? white 
                          : black,
                          fontSize: 20),
                    ),
                    showCheckmark: false,
                    selected: breed.selected.value,
                    selectedColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.grey)),
                    onSelected: (bool selected) {
                      controller.toggleBreedSelection(breed);
                      if (selected) {
                        // ignore: unused_local_variable
                        int index = controller.breeds.indexOf(breed);
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ).paddingAll(Get.height * 0.02),
      ),
    );
  }
}
