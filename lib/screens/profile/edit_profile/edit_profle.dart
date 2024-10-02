import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/components/image_picker_widget.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/profile/edit_profile/edit%20profile_controller.dart';
import 'package:adoptify/screens/profile/edit_profile/model/edit_profile_model.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/constants.dart';

class MyProfile extends StatelessWidget {
  final MyprofileController controller = Get.put(MyprofileController());

  MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Text(
        "My Profile",
        style: primaryTextStyle(size: 18, color: isDarkMode.value ? white : black, weight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image(
            image: NetworkImage("${BaseUrl}/images/adoptify/icons/more.png"),
            color: isDarkMode.value ? Colors.white70 : Colors.black87,
            height: 18,
          ),
        )
      ],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImageSelector(),
                30.height,
                Text(
                  "Full Name",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w500),
                ),
                10.height,
                TextField(
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 20),
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    hintText: 'Enter Your Name',
                    hintStyle: secondaryTextStyle(
                      color: Colors.grey,
                      size: 16,
                      weight: FontWeight.w300,
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
                25.height,
                Text(
                  "Email",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w500),
                ),
                10.height,
                TextField(
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 16),
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    hintText: 'Enter Email',
                    prefixIcon: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_mail.png"),
                      color: isDarkMode.value ? grey : Colors.black45,
                      height: 20,
                    ).paddingAll(16),
                    hintStyle: secondaryTextStyle(
                      color: Colors.grey,
                      size: 16,
                      weight: FontWeight.w300,
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
                25.height,
                Text(
                  "Phone Number",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w500),
                ),
                Container(
                  height: 80,
                  child: IntlPhoneField(
                    controller: controller.phoneController,
                    autovalidateMode: AutovalidateMode.disabled,
                    style: primaryTextStyle(
                      color: isDarkMode.value ? Colors.white : Colors.black,
                    ),
                    dropdownTextStyle: primaryTextStyle(
                      color: isDarkMode.value ? Colors.white : Colors.black,
                    ),
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
                  ).paddingSymmetric(vertical: 12),
                ),
                10.height,
                Text(
                  "Gender",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w500),
                ),
                10.height,
                DropdownButtonFormField<String>(
                  dropdownColor: context.cardColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                    hintText: 'Select Your Gender',
                    hintStyle: secondaryTextStyle(
                      color: Colors.grey,
                      size: 16,
                      weight: FontWeight.w300,
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
                25.height,
                Text(
                  "Birthdate",
                  style: primaryTextStyle(color: isDarkMode.value ? Colors.white : Colors.black, size: 18, weight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: primaryTextStyle(color: isDarkMode.value ? Colors.white : Colors.black),
                  controller: controller.dateController,
                  readOnly: true,
                  onTap: () {
                    controller.selectDate(context, controller);
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: context.cardColor,
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      hintText: 'Select Date',
                      hintStyle: secondaryTextStyle(
                        color: isDarkMode.value ? Colors.white30 : Colors.black38,
                      ),
                      suffixIcon: Image(
                        image: NetworkImage("${BaseUrl}/images/adoptify/profile/calendar.png"),
                        color: isDarkMode.value ? grey : Colors.black45,
                        height: 20,
                      ).paddingAll(Get.height * 0.02),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: primaryColor))),
                ),
                120.height,
              ],
            ).paddingAll(Get.height * 0.02),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
              child: AppButton(
                elevation: 0,
                text: "Save",
                textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                color: primaryColor,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                onTap: () {
                  Get.back();
                },
              ).paddingSymmetric(vertical: 30, horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
