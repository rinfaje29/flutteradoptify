import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class SwitchButtonWidget extends StatelessWidget {
  final String title;
  final RxBool switchValue;

  SwitchButtonWidget({super.key, required this.title, required this.switchValue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switchValue.value = !switchValue.value;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: primaryTextStyle(size: 16, color: isDarkMode.value ? white : black, weight: FontWeight.bold),
          ),
          Obx(
            () => Switch(
              activeColor: white,
              inactiveThumbColor: white,
              inactiveTrackColor: isDarkMode.value ? Colors.white12 : Colors.black12,
              trackOutlineColor: MaterialStatePropertyAll(context.cardColor),
              activeTrackColor: primaryColor,
              value: switchValue.value,
              onChanged: (value) {
                switchValue.value = value;
              },
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
