import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/constants.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isDelete;
  final VoidCallback? onTap;

  ListTileWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.isDelete = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          title,
          style: primaryTextStyle(
            size: 16,
            color: isDelete ? cancelStatusColor : (isDarkMode.value ? white : black),
            weight: FontWeight.bold,
          ),
        ).paddingBottom(5),
        subtitle: Text(
          subtitle ?? "",
          style: secondaryTextStyle(
            size: 14,
            color: isDarkMode.value ? Colors.white54 : Colors.black54,
          ),
        ),
        trailing: Image(
          image: NetworkImage("${BaseUrl}/images/adoptify/icons/next.png"),
          height: 20,
          color: isDarkMode.value ? white : black,
        ),
        onTap: onTap,
      ),
    );
  }
}
