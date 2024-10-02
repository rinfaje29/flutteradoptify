import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/generated/assets.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/chat/calling_screen/calling_screen.dart';
import 'package:adoptify/screens/chat/components/message_call_component.dart';
import 'package:adoptify/screens/chat/message_screen/message_screen.dart';
import 'package:adoptify/screens/chat/video_calling_screen/video_call.dart';
import 'package:adoptify/screens/search_screen/search.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/constants.dart';
import 'chat_controller.dart';

class Message extends StatelessWidget {
  final MessageController controller = Get.put(MessageController());

  Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return controller.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        leadingWidget: Image(
          image: NetworkImage("${BaseUrl}/images/adoptify/image/adoptify.png"),
          color: primaryColor,
          height: 30,
        ).paddingOnly(left: Get.width * 0.02),
        isCenterTitle: true,
        appBarTitle: Obx(
          () => Text(
            "Messages",
            style: primaryTextStyle(color: isDarkMode.value ? white : black, weight: FontWeight.bold, size: 18),
          ),
        ),
        actions: [
          Obx(
            () => GestureDetector(
              onTap: () {
                Get.to(() => Search());
              },
              child: Image(
                image: AssetImage(Assets.iconsSearch),
                height: 18,
                color: isDarkMode.value ? Colors.white70 : Colors.black87,
              ).paddingAll(Get.height * 0.008),
            ),
          ),
          10.width,
          Obx(
            () => GestureDetector(
              onTap: () {},
              child: Image(
                image: NetworkImage("${BaseUrl}/images/adoptify/icons/more.png"),
                height: 18,
                color: isDarkMode.value ? Colors.white70 : Colors.black87,
              ).paddingAll(Get.height * 0.008),
            ).paddingOnly(right: Get.width * 0.04),
          )
        ],
        body: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => controller.selectedTabIndex.value = 0,
                    child: Container(
                      height: Get.height * 0.055,
                      width: Get.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.selectedTabIndex.value == 0 ? primaryColor : context.cardColor,
                      ),
                      child: Center(
                        child: Text(
                          "Chats (${controller.message.length})",
                          style: primaryTextStyle(
                            color: controller.selectedTabIndex.value == 0 || isDarkMode.value ? white : Colors.black,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.selectedTabIndex.value = 1,
                    child: Container(
                      height: Get.height * 0.055,
                      width: Get.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.selectedTabIndex.value == 1 ? primaryColor : context.cardColor,
                      ),
                      child: Center(
                        child: Text(
                          "Calls",
                          style: primaryTextStyle(
                            color: controller.selectedTabIndex.value == 1 || isDarkMode.value ? white : Colors.black,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingAll(Get.height * 0.02),
            ),
            Obx(
              () => controller.selectedTabIndex.value == 0
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: controller.message.length,
                        itemBuilder: (context, index) {
                          final chat = controller.message[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ChatScreen(chatName: chat.name, imagePath: controller.message[index].image));
                              print("Message index tapped: $index");
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(chat.image ?? ""),
                                radius: 25,
                              ),
                              title: Text(
                                chat.name ?? "",
                                style: primaryTextStyle(
                                  weight: FontWeight.bold,
                                  color: isDarkMode.value ? white : black,
                                ),
                              ),
                              subtitle: Text(
                                chat.message ?? "",
                                style: secondaryTextStyle(
                                  color: isDarkMode.value ? Colors.white54 : Colors.black54,
                                ),
                              ),
                              trailing: ChatComponent(chat: chat),
                            ).paddingSymmetric(vertical: 5, horizontal: Get.width * 0.02),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: controller.call.length,
                        itemBuilder: (context, index) {
                          final call = controller.call[index];
                          return GestureDetector(
                            onTap: () {
                              print("object");
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(call.image ?? ""),
                                radius: 25,
                              ),
                              title: Text(
                                call.name ?? "",
                                style: primaryTextStyle(
                                  weight: FontWeight.bold,
                                  color: isDarkMode.value ? white : black,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(call.indication ?? ""),
                                    height: 10,
                                    color: isDarkMode.value ? white : black,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    call.time ?? "",
                                    style: secondaryTextStyle(
                                      color: isDarkMode.value ? Colors.white54 : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  if (call.callimage == "${BaseUrl}/images/adoptify/icons/telephone.png") {
                                    Get.to(() => Callscreen(image: call.image, name: call.name));
                                  } else {
                                    Get.to(() => VideoCallscreen());
                                  }
                                },
                                icon: Image(
                                  image: NetworkImage(call.callimage ?? ""),
                                  color: primaryColor,
                                  height: 22,
                                ),
                              ),
                            ).paddingSymmetric(vertical: 5, horizontal: Get.width * 0.01),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ).paddingSymmetric(horizontal: Get.height * 0.01),
      ),
    );
  }
}
