import 'package:adoptify/components/image_picker_widget.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/auth/signup_screen/signup_controller.dart';
import 'package:adoptify/screens/auth/signup_screen/signup_model.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart';

class DetailPage4 extends StatelessWidget {
  final double? picSize;
  final SignUpController controller = Get.put(SignUpController());

  DetailPage4({super.key, this.picSize});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Final Steps!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.08, color: isDarkMode.value ? white : black),
            ),
            30.height,
            Text(
              "We're almost there! Fill in your personal details to create a profile and start your journey towards a furry friendship.",
              style: TextStyle(fontSize: Get.width * 0.04, color: isDarkMode.value ? Colors.white38 : Colors.black45),
            ),
            40.height,
            ProfileImageSelector(),
            10.height,
            Text(
              "Full Name",
              style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            10.height,
            TextField(
              style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 20),
              controller: controller.nameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                hintText: 'Enter Your Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                fillColor: context.cardColor,
                filled: true,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              //onTap: () {},
            ),
            20.height,
            Text(
              "Phone Number",
              style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            10.height,
            Container(
              height: 80,
              child: IntlPhoneField(
                controller: controller.phoneController,
                autovalidateMode: AutovalidateMode.disabled,
                style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 23),
                dropdownTextStyle: TextStyle(color: isDarkMode.value ? white : black, fontSize: 23),
                decoration: InputDecoration(
                  fillColor: context.cardColor,
                  hintText: "Enter Phone Number",
                  hintStyle: primaryTextStyle(
                    color: Colors.grey,
                    size: 16,
                    weight: FontWeight.w300,
                  ),
                  filled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                initialCountryCode: 'US',
                disableLengthCheck: true,
                dropdownIconPosition: IconPosition.trailing,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: context.cardColor,
                ),
                flagsButtonPadding: EdgeInsets.only(left: Get.width * 0.015),
                cursorColor: primaryColor,
              ).paddingSymmetric(vertical: 15),
            ),
            10.height,
            Text(
              "Gender",
              style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            10.height,
            DropdownButtonFormField<String>(
              dropdownColor: context.cardColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                hintText: 'Select Your Gender',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                fillColor: context.cardColor,
                filled: true,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              value: controller.selectedGender.value,
              onChanged: (String? newValue) {
                controller.selectedGender.value = newValue!;
                controller.genderController.text = newValue;
              },
              items: controller.genders.map<DropdownMenuItem<String>>((GenderModel value) {
                return DropdownMenuItem<String>(
                  value: value.gender,
                  child: Text(
                    value.gender,
                    style: TextStyle(color: isDarkMode.value ? white : black),
                  ),
                );
              }).toList(),
            ),
            120.height,
          ],
        ).paddingAll(Get.height * 0.02),
      ),
    );
  }
}
