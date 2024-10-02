import 'package:adoptify/components/adoptify_loader.dart';
import 'package:adoptify/utils/color.dart';
import 'package:adoptify/utils/constants.dart';
import 'package:adoptify/walkthrough/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => WalkThrough());
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            200.height,
            Image.network(
              "${BaseUrl}/images/adoptify/image/adoptify.png",
              height: Get.height * 0.2,
            ),
            30.height,
            Text(
              'Adoptify',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w600,
                // ignore: deprecated_member_use
              ),
            ).paddingBottom(Get.height * 0.2),
            LoaderWidget(
              color: white,
            )
          ],
        ),
      ),
    );
  }
}
