import 'package:adoptify/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/constants.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: Get.height * 0.07,
          width: Get.width * 0.9,
          child: AppButton(
            width: Get.width,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                20.width,
                Image(image: NetworkImage("${BaseUrl}/images/adoptify/icons/google.png")),
                40.width,
                Text(
                  "Continue with Google",
                  style: TextStyle(
                    fontSize: Get.width * 0.05,
                  ),
                )
              ],
            ),
            color: context.cardColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onTap: () {},
          ),
        ),
        20.height,
        Container(
          height: Get.height * 0.067,
          width: Get.width * 0.9,
          child: AppButton(
            width: Get.width,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                20.width,
                Image(image: NetworkImage(isDarkMode.value ? "${BaseUrl}/images/adoptify/icons/apple.png" : "${BaseUrl}/images/adoptify/icons/apple-light.png")),
                40.width,
                Text(
                  "Continue with Apple",
                  style: TextStyle(
                    fontSize: Get.width * 0.05,
                  ),
                )
              ],
            ),
            color: context.cardColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onTap: () {},
          ),
        ),
        20.height,
        Container(
          height: Get.height * 0.067,
          width: Get.width * 0.9,
          child: AppButton(
            width: Get.width,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                20.width,
                Image(image: NetworkImage("${BaseUrl}/images/adoptify/icons/facebook.png")),
                40.width,
                Text(
                  "Continue with Facebook",
                  style: TextStyle(
                    fontSize: Get.width * 0.05,
                  ),
                )
              ],
            ),
            color: context.cardColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onTap: () {},
          ),
        ),
        20.height,
        Container(
          height: Get.height * 0.067,
          width: Get.width * 0.9,
          child: AppButton(
            width: Get.width,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                20.width,
                Image(image: NetworkImage("${BaseUrl}/images/adoptify/icons/twitter.png")),
                40.width,
                Text(
                  "Continue with Twitter",
                  style: TextStyle(fontSize: Get.width * 0.05),
                )
              ],
            ),
            color: context.cardColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
