import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/components/list_tile_widget.dart';
import 'package:adoptify/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DataAnalytics extends StatelessWidget {
  const DataAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Text(
        "Data Analytics",
        style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          ListTileWidget(
            title: "Data Usage",
            subtitle: "Control how your data is used for analytics. Customize your preferences.",
            onTap: () {},
          ),
          ListTileWidget(
            title: "Ad Preferences",
            subtitle: "Manage ad personalization settings. Tailor your ad experience.",
            onTap: () {},
          ),
          ListTileWidget(
            title: "Download My Data",
            subtitle: "Request a copy of your data. Your information. your control.",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
