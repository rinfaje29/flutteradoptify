import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/constants.dart';

class LinkedAccount extends StatelessWidget {
  const LinkedAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Text(
        "Linked Account",
        style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
      ),
      body: Column(
        children: [
          linkedAcc(
            context: context,
            imagepath: "${BaseUrl}/images/adoptify/icons/google.png",
            status: "Connected",
            title: "Google",
            onTap: () {},
          ),
          linkedAcc(
            context: context,
            imagepath: isDarkMode.value ? "${BaseUrl}/images/adoptify/icons/apple.png" : "${BaseUrl}/images/adoptify/icons/apple-light.png",
            status: "Connected",
            title: "Apple",
            onTap: () {},
          ),
          linkedAcc(
            context: context,
            imagepath: "${BaseUrl}/images/adoptify/icons/facebook.png",
            status: "Conntect",
            title: "Facebook",
            isconnected: true,
            onTap: () {},
          ),
          linkedAcc(
            context: context,
            imagepath: "${BaseUrl}/images/adoptify/icons/twitter.png",
            status: "Conntect",
            title: "Twitter",
            isconnected: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget linkedAcc({required BuildContext context, required String imagepath, required String title, required String status, bool isconnected = false, required VoidCallback onTap}) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image(
            image: NetworkImage(imagepath),
            height: 25,
          ).paddingBottom(10),
          title: Text(
            title,
            style: primaryTextStyle(size: 18, color: isDarkMode.value ? white : black, weight: FontWeight.bold),
          ).paddingBottom(Get.height * 0.01),
          trailing: Text(
            status,
            style: secondaryTextStyle(size: 16, color: isconnected ? primaryColor : (isDarkMode.value ? white : black), weight: FontWeight.bold),
          ),
          onTap: onTap,
        ),
      ).paddingSymmetric(horizontal: 16),
    ).paddingAll(16);
  }
}
