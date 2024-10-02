import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/profile/app_appearance_screen/app_appearancecontroller.dart';
import 'package:adoptify/screens/profile/app_appearance_screen/app_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class AppAppearance extends StatelessWidget {
  final AppAppearanceController _controller = Get.put(AppAppearanceController());

  final commonPadding = EdgeInsets.symmetric(vertical: Get.height * 0.007, horizontal: Get.width * 0.035);

  AppAppearance({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Obx(
        () => Text(
          "App Appearance",
          style: primaryTextStyle(
            color: isDarkMode.value ? white : black,
            weight: FontWeight.bold,
            size: 18,
          ),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            SettingItemWidget(
              title: "Theme",
              splashColor: transparentColor,
              titleTextStyle: primaryTextStyle(
                color: isDarkMode.value ? white : black,
                size: 16,
                weight: FontWeight.bold,
              ),
              trailing: Obx(() => Row(
                    children: [
                      Text(
                        _controller.getThemeModeString(isDarkMode.value ? ThemeMode.dark : ThemeMode.light),
                        style: primaryTextStyle(
                          color: isDarkMode.value ? Colors.white : Colors.black,
                          size: 14,
                        ),
                      ),
                      10.width,
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: isDarkMode.value ? Colors.white : Colors.black,
                      ),
                    ],
                  )),
              padding: commonPadding,
              onTap: () {
                _controller.showThemeBottomSheet(context);
              },
            ),
            20.height,
            SettingItemWidget(
              title: "App Language",
              splashColor: transparentColor,
              titleTextStyle: primaryTextStyle(
                color: isDarkMode.value ? white : black,
                size: 16,
                weight: FontWeight.bold,
              ),
              trailing: Obx(() => Row(
                    children: [
                      Text(
                        _controller.getSelectedLanguageName(),
                        style: TextStyle(
                          color: isDarkMode.value ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      10.width,
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: isDarkMode.value ? Colors.white : Colors.black,
                      ),
                    ],
                  )),
              padding: commonPadding,
              onTap: () {
                Get.to(() => AppLanguage());
              },
            ),
          ],
        ).paddingAll(Get.height * 0.02),
      ),
    );
  }

  Widget get trailing => Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: isDarkMode.value ? Colors.white : Colors.black,
      );
}
