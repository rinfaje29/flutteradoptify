import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/components/switch_button_widget.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/profile/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class ManageNotification extends StatelessWidget {
  final ManageNotificationController controller = Get.put(ManageNotificationController());

  ManageNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Text(
        "Notification",
        style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchButtonWidget(
              title: 'Adoption Updates',
              switchValue: controller.AdoptionUpdates,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Matching Preference',
              switchValue: controller.MatchingPreference,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Favorites Updates',
              switchValue: controller.FavoritesUpdates,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Security Alerts',
              switchValue: controller.SecurityAlerts,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Event Reminders',
              switchValue: controller.EventReminders,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Shelter Updates',
              switchValue: controller.ShelterUpdates,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Community Engagement',
              switchValue: controller.CommunityEngagement,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'General App Updates',
              switchValue: controller.GeneralAppUpdates,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Important Announcements',
              switchValue: controller.ImportantAnnouncements,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'App Tips and Tutorials',
              switchValue: controller.AppTipsandTutorials,
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
