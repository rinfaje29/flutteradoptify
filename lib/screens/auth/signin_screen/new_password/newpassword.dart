import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/auth/signin_screen/new_password/newpassword_controller.dart';
import 'package:adoptify/screens/auth/signin_screen/success_page/success_page.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/constants.dart';

class NewPassword extends StatelessWidget {
  final NewPasswordController _controller = Get.put(NewPasswordController());

  NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Secure Your Account 🔒",
                    style: primaryTextStyle(weight: FontWeight.bold, size: 25, color: isDarkMode.value ? white : black),
                  ),
                  30.height,
                  Text(
                    "Almost there! Create a new password for your Adoptify account to keep it secure. Remember to choose a strong and unique password.",
                    style: secondaryTextStyle(size: 18, color: isDarkMode.value ? Colors.white38 : Colors.black45),
                  ),
                  50.height,
                  Text(
                    "New Password",
                    style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w500),
                  ),
                  10.height,
                  Obx(
                    () => TextField(
                      style: primaryTextStyle(
                        color: isDarkMode.value ? white : black,
                      ),
                      obscureText: _controller.is_Visible.value,
                      controller: _controller.newController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        hintText: 'Password',
                        hintStyle: secondaryTextStyle(
                          color: Colors.grey,
                          size: 16,
                          weight: FontWeight.w300,
                        ),
                        fillColor: context.cardColor,
                        filled: true,
                        prefixIcon: Image(
                          image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_lock.png"),
                          color: isDarkMode.value ? grey : Colors.black45,
                          height: 18,
                        ).paddingAll(16),
                        suffixIcon: IconButton(
                          icon: ImageIcon(
                            NetworkImage(
                              _controller.is_Visible.value ? "${BaseUrl}/images/adoptify/image/ic_eye_slash.png" : "${BaseUrl}/images/adoptify/image/ic_eye.png",
                            ),
                            size: 20,
                            color: isDarkMode.value ? grey : Colors.black45,
                          ),
                          onPressed: _controller.toggle_PasswordVisibility,
                        ),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  20.height,
                  Text(
                    "Confirm New Password",
                    style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w500),
                  ),
                  10.height,
                  Obx(
                    () => TextField(
                      style: primaryTextStyle(
                        color: isDarkMode.value ? white : black,
                      ),
                      obscureText: _controller.isVisible.value,
                      controller: _controller.confirmController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        hintText: 'Password',
                        hintStyle: secondaryTextStyle(
                          color: Colors.grey,
                          size: 16,
                          weight: FontWeight.w300,
                        ),
                        fillColor: context.cardColor,
                        filled: true,
                        prefixIcon: Image(
                          image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_lock.png"),
                          color: isDarkMode.value ? grey : Colors.black45,
                          height: 18,
                        ).paddingAll(16),
                        suffixIcon: IconButton(
                          icon: ImageIcon(
                            NetworkImage(
                              _controller.isVisible.value ? "${BaseUrl}/images/adoptify/image/ic_eye_slash.png" : "${BaseUrl}/images/adoptify/image/ic_eye.png",
                            ),
                            size: 20,
                            color: isDarkMode.value ? grey : Colors.black45,
                          ),
                          onPressed: _controller.togglePasswordVisibility,
                        ),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      //onTap: () {},
                    ),
                  ),
                  120.height,
                ],
              ).paddingAll(Get.height * 0.02),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                  child: AppButton(
                    elevation: 0,
                    text: "Save New Password",
                    textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                    color: primaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      Get.off(() => SuccessPage());
                    },
                  ).paddingSymmetric(vertical: 30, horizontal: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
