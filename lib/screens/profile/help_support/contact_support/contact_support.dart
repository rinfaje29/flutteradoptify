import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/constants.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Obx(
        () => Text(
          "Customer Support",
          style: primaryTextStyle(color: isDarkMode.value ? white : black, weight: FontWeight.bold, size: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            listdata(context, "Customer Support", "${BaseUrl}/images/adoptify/profile/support.png", () {}),
            listdata(context, "Website", "${BaseUrl}/images/adoptify/profile/globe.png", () {}),
            listdata(context, "WhatsApp", "${BaseUrl}/images/adoptify/profile/whatsapp.png", () {}),
            listdata(context, "Facebook", "${BaseUrl}/images/adoptify/profile/facebook.png", () {}),
            listdata(context, "Twitter", "${BaseUrl}/images/adoptify/profile/twitter.png", () {}),
            listdata(context, "Instagram", "${BaseUrl}/images/adoptify/profile/instagram.png", () {}),
          ],
        ).paddingAll(Get.height * 0.02),
      ),
    );
  }

  Widget listdata(BuildContext context, String title, String imagepath, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: context.cardColor),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image(
          image: NetworkImage(imagepath),
          height: 25,
          color: primaryColor,
        ),
        title: Text(
          title,
          style: primaryTextStyle(
            size: 16,
            color: isDarkMode.value ? white : black,
            weight: FontWeight.bold,
          ),
        ).paddingBottom(Get.height * 0.01),
        trailing: Image(
          image: NetworkImage("${BaseUrl}/images/adoptify/icons/next.png"),
          height: 20,
          color: isDarkMode.value ? white : black,
        ),
        onTap: onTap,
      ).paddingAll(Get.height * 0.01),
    ).paddingAll(Get.height * 0.009);
  }
}
