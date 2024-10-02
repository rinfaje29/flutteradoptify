import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/auth/signin_screen/forgot_password/forgotpassword_controller.dart';
import 'package:adoptify/screens/auth/signin_screen/new_password/newpassword.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class OTPPage extends StatelessWidget {
  final OTPController controller = Get.put(OTPController());
  String enteredOTP = '';

  OTPPage({Key? key}) : super(key: key) {
    controller.countdownTick();
  }

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
                    "Enter OTP Code 🔐 ",
                    style: primaryTextStyle(weight: FontWeight.bold, size: 25, color: isDarkMode.value ? white : black),
                  ),
                  30.height,
                  Text(
                    "Please check your email inbox for a message from Adoptify. Enter the one-time verification code below",
                    style: secondaryTextStyle(size: 18, color: isDarkMode.value ? Colors.white38 : Colors.black45),
                  ),
                  50.height,
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OTPTextField(
                          pinLength: 4,
                          boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: context.cardColor),
                          fieldWidth: 60,
                          textStyle: primaryTextStyle(size: 20, color: isDarkMode.value ? white : black),
                          onChanged: (pin) {
                            print("Changed: " + pin);
                            enteredOTP = pin;
                          },
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          },
                        ),
                        40.height,
                        if (!controller.showResendButton.value)
                          RichText(
                            text: TextSpan(
                              text: 'You can resend the code in ',
                              style: secondaryTextStyle(color: isDarkMode.value ? white : black),
                              children: <TextSpan>[
                                TextSpan(text: '${controller.countdown.value}', style: TextStyle(color: primaryColor)),
                                TextSpan(text: ' seconds'),
                              ],
                            ),
                          ),
                        10.height,
                        TextButton(
                          onPressed: controller.showResendButton.value
                              ? () {
                                  print('Resend code button pressed');
                                  controller.restartCountdown();
                                }
                              : null,
                          child: Text(
                            'Resend code',
                            style: secondaryTextStyle(color: controller.showResendButton.value ? primaryColor : Colors.grey, size: 16, weight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
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
                    text: "Verify",
                    textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                    color: primaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      if (enteredOTP.length == 4) {
                        Get.off(() => NewPassword());
                      } else {
                        print("OTP is not complete");
                      }
                    },
                  ).paddingSymmetric(vertical: 30, horizontal: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
