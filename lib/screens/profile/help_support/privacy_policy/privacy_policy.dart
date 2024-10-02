import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:adoptify/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
      child: AppScaffold(
        isCenterTitle: true,
        appBarTitle: Obx(
          () => Text(
            "Privacy Policy",
            style: primaryTextStyle(color: isDarkMode.value ? white : black, weight: FontWeight.bold, size: 18),
          ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 3,
          radius: Radius.circular(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Effective Date: December 19, 2024",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
                ),
                30.height,
                tile(
                  context,
                  "1. Information Collection:",
                  PrivacyPolicyrules.InformationCollection,
                ),
                tile(
                  context,
                  "2. Information Usage:",
                  PrivacyPolicyrules.InformationUsage,
                ),
                tile(
                  context,
                  "3. Information Sharing:",
                  PrivacyPolicyrules.InformationSharing,
                ),
                tile(
                  context,
                  "4. Security Measures :",
                  PrivacyPolicyrules.SecurityMeasures,
                ),
                tile(
                  context,
                  "5. Cookies",
                  PrivacyPolicyrules.Cookies,
                ),
                tile(
                  context,
                  "6. Cookies",
                  PrivacyPolicyrules.Cookies,
                ),
              ],
            ).paddingAll(Get.height * 0.02),
          ),
        ),
      ),
    );
  }

  Widget tile(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: primaryTextStyle(
          size: 18,
          color: isDarkMode.value ? white : black,
          weight: FontWeight.bold,
        ),
      ).paddingBottom(10),
      subtitle: Text(
        subtitle,
        style: secondaryTextStyle(
          size: 17,
          color: isDarkMode.value ? Colors.white70 : Colors.black87,
        ),
      ),
    ).paddingBottom(9);
  }
}
