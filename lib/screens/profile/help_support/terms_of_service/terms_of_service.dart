import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:adoptify/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class TermOfService extends StatelessWidget {
  const TermOfService({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all<Color>(primaryColor), // Change the color here
      ),
      child: AppScaffold(
        isCenterTitle: true,
        appBarTitle: Obx(
          () => Text(
            "Terms of Service",
            style: primaryTextStyle(color: isDarkMode.value ? white : black, weight: FontWeight.bold, size: 18),
          ),
        ),
        body: Scrollbar(
          trackVisibility: true,
          thumbVisibility: true,
          thickness: 3,
          radius: Radius.circular(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Effective Date: December 20, 2024",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
                ),
                30.height,
                tile(
                  context,
                  "1. Acceptance of Terms:",
                  TermsofServicerule.AcceptanceofTerms,
                ),
                tile(
                  context,
                  "2. Eligibility:",
                  TermsofServicerule.Eligibility,
                ),
                tile(
                  context,
                  "3. User Accounts:",
                  TermsofServicerule.UserAccounts,
                ),
                tile(
                  context,
                  "4. Adoption Process :",
                  TermsofServicerule.AdoptionProcess,
                ),
                tile(
                  context,
                  "5. User Conduct",
                  TermsofServicerule.UserConduct,
                ),
                tile(
                  context,
                  "6. Intellectual Property",
                  TermsofServicerule.IntellectualProperty,
                ),
                tile(
                  context,
                  "7. Intellectual Property",
                  TermsofServicerule.IntellectualProperty,
                ),
                tile(
                  context,
                  "8. Intellectual Property",
                  TermsofServicerule.IntellectualProperty,
                ),
                tile(
                  context,
                  "9. Intellectual Property",
                  TermsofServicerule.IntellectualProperty,
                ),
              ],
            ).paddingAll(16),
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
