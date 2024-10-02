import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/components/list_tile_widget.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/profile/help_support/contact_support/contact_support.dart';
import 'package:adoptify/screens/profile/help_support/faq/faq.dart';
import 'package:adoptify/screens/profile/help_support/privacy_policy/privacy_policy.dart';
import 'package:adoptify/screens/profile/help_support/terms_of_service/terms_of_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Obx(
        () => Text(
          "Help & Support",
          style: primaryTextStyle(color: isDarkMode.value ? white : black, weight: FontWeight.bold, size: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTileWidget(
                title: "FAQ",
                onTap: () {
                  Get.to(() => FAQ());
                }),
            ListTileWidget(
                title: "Contact Support",
                onTap: () {
                  Get.to(() => ContactSupport());
                }),
            ListTileWidget(
                title: "Privacy Policy",
                onTap: () {
                  Get.to(() => PrivacyPolicy());
                }),
            ListTileWidget(
                title: "Terms of Service",
                onTap: () {
                  Get.to(() => TermOfService());
                }),
            ListTileWidget(title: "Partner", onTap: () {}),
            ListTileWidget(title: "Job Vacancy", onTap: () {}),
            ListTileWidget(title: "Accessibility", onTap: () {}),
            ListTileWidget(title: "Feedback", onTap: () {}),
            ListTileWidget(title: "About us", onTap: () {}),
            ListTileWidget(title: "Rate us", onTap: () {}),
            ListTileWidget(title: "Visit Our Website", onTap: () {}),
            ListTileWidget(title: "Follow us on Social Media", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
