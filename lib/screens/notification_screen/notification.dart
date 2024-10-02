import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/notification_screen/notification_controller.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/constants.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());
  final commonpadding = EdgeInsets.symmetric(vertical: Get.height * 0.007, horizontal: Get.width * 0.035);

  NotificationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Text(
        "Notification",
        style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
      ),
      actions: [
        Obx(
          () => GestureDetector(
            onTap: () {},
            child: Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/icons/setting.png"),
              height: 18,
              color: isDarkMode.value ? Colors.white70 : Colors.black87,
            ),
          ).paddingAll(16),
        )
      ],
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "Today",
                style: primaryTextStyle(
                  color: isDarkMode.value ? Colors.white24 : Colors.black26,
                ),
              ),
              Expanded(
                child: Divider(
                  color: isDarkMode.value ? Colors.white24 : Colors.black26,
                ).paddingSymmetric(horizontal: 5),
              ),
            ],
          ),
          20.height,
          Expanded(
            child: ListView.builder(
              itemCount: controller.notifications.length,
              itemBuilder: (context, index) {
                var notification = controller.notifications[index];
                Widget trailing = Row(
                  children: [
                    if (notification.hasNotification)
                      Icon(
                        Icons.circle,
                        color: primaryColor,
                        size: 12,
                      ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: isDarkMode.value ? Colors.white : Colors.black,
                    ),
                  ],
                );

                Widget listItem = SettingItemWidget(
                  title: notification.title,
                  subTitle: notification.description,
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: isDarkMode.value ? Colors.white : Colors.black, size: 16, weight: FontWeight.bold),
                  subTitleTextStyle: primaryTextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                    size: 14,
                  ),
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDarkMode.value ? Colors.white24 : Colors.black26,
                      ),
                    ),
                    child: Image(
                      image: NetworkImage(notification.icon),
                      height: 22,
                      color: isDarkMode.value ? white : black,
                    ).paddingAll(9),
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {},
                );

                if (index % 4 == 1 && index != controller.notifications.length - 1) {
                  return Column(
                    children: [
                      listItem,
                      Row(
                        children: [
                          Text(
                            "Yesterday",
                            style: primaryTextStyle(
                              color: isDarkMode.value ? Colors.white24 : Colors.black26,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: isDarkMode.value ? Colors.white24 : Colors.black26,
                              thickness: 1,
                              height: 0,
                            ).paddingSymmetric(horizontal: 16, vertical: 20),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return listItem;
                }
              },
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }
}
