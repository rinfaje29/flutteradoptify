import 'dart:ui';

import 'package:adoptify/components/adoptify_loader.dart';
import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/auth/components/signup_button_component.dart';
import 'package:adoptify/screens/auth/signin_screen/forgot_password/forgot_password.dart';
import 'package:adoptify/screens/auth/signin_screen/signin_controller.dart';
import 'package:adoptify/screens/dashbord/dashboard.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/constants.dart';

class SignInPage extends StatelessWidget {
  final SigninController controller = Get.put(SigninController());

  SignInPage({super.key});

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
                    "Welcome Back 👋",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.08, color: isDarkMode.value ? white : black),
                  ),
                  30.height,
                  Text(
                    "Let's continues the journey  with your furry friends.",
                    style: TextStyle(fontSize: Get.width * 0.04, color: isDarkMode.value ? Colors.white38 : Colors.black45),
                  ),
                  50.height,
                  Text(
                    "Email",
                    style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  10.height,
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: isDarkMode.value ? white : black,
                    ),
                    controller: controller.EmailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      fillColor: context.cardColor,
                      filled: true,
                      prefixIcon: Image(
                        image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_mail.png"),
                        color: isDarkMode.value ? grey : Colors.black45,
                        height: 18,
                      ).paddingAll(16),
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
                  30.height,
                  Text(
                    "Password",
                    style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  10.height,
                  Obx(
                    () => TextField(
                      style: TextStyle(
                        color: isDarkMode.value ? white : black,
                      ),
                      obscureText: controller.is_Visible.value,
                      controller: controller.PasswordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
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
                              controller.is_Visible.value ? "${BaseUrl}/images/adoptify/image/ic_eye_slash.png" : "${BaseUrl}/images/adoptify/image/ic_eye.png",
                            ),
                            color: isDarkMode.value ? grey : Colors.black45,
                            size: 20,
                          ),
                          onPressed: controller.toggle_PasswordVisibility,
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
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      setAsPrimaryWidget(),
                      TextButton(
                          onPressed: () {
                            Get.to(() => ForgotPassword());
                          },
                          child: Text("Forgot Password?", style: TextStyle(color: primaryColor, fontSize: 15)))
                    ],
                  ),
                  40.height,
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Divider(
                          color: isDarkMode.value ? Color.fromARGB(255, 84, 84, 84) : Color(0xFFD8D9D9),
                          height: Get.height * 0.001,
                        ),
                      ).expand(),
                      Text(
                        "or",
                        style: TextStyle(color: secondaryTextColor, fontSize: 20),
                      ).paddingSymmetric(horizontal: 20),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Divider(color: isDarkMode.value ? Color.fromARGB(255, 84, 84, 84) : Color(0xFFD8D9D9)),
                      ).expand(),
                    ],
                  ),
                  50.height,
                  SignupButton(),
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
                    text: "Sign In",
                    textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                    color: primaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Obx(
                            () => Stack(
                              children: [
                                BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ),
                                AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      LoaderWidget(
                                        color: primaryColor,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Sign In...",
                                        style: TextStyle(color: isDarkMode.value ? white : black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Get.offAll(() => Dashboard());
                      });
                    },
                  ).paddingSymmetric(vertical: 30, horizontal: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget setAsPrimaryWidget() {
    return Obx(
      () => Container(
        width: Get.width * 0.450,
        child: ListTileTheme(
          horizontalTitleGap: 0.0,
          child: CheckboxListTile(
            value: controller.checkboxValue.value,
            checkColor: white,
            title: Text("Remember me", style: TextStyle(color: isDarkMode.value ? white : black, fontSize: 14)),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            checkboxShape: RoundedRectangleBorder(borderRadius: radius(5)),
            side: const BorderSide(color: primaryColor),
            dense: true,
            activeColor: isDarkMode.value ? primaryColor : primaryColor,
            onChanged: (value) {
              controller.checkboxValue(!controller.checkboxValue.value);
            },
          ),
        ),
      ),
    );
  }
}
