import 'package:adoptify/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileController extends GetxController {
  var lastBackPressTime = 0.obs;

  bool onWillPop(BuildContext context) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - lastBackPressTime.value < 2000) {
      return true; // Exit the app
    } else {
      lastBackPressTime.value = currentTime;
      Fluttertoast.showToast(
        msg: "Press Back Again to Exit",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: context.cardColor,
        textColor: isDarkMode.value ? white : black,
        fontSize: 16.0,
      );
      return false;
    }
  }
}
