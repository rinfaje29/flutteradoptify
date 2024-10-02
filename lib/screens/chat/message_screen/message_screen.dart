import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/chat/calling_screen/calling_screen.dart';
import 'package:adoptify/screens/chat/video_calling_screen/video_call.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/constants.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final String? imagePath;
  final String? chatName;

  ChatScreen({Key? key, this.imagePath, this.chatName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: AppBar(
        title: Text(
          chatName ?? "",
          style: primaryTextStyle(weight: FontWeight.bold, size: 18, color: isDarkMode.value ? white : black),
        ),
        automaticallyImplyLeading: false,
      ),
      actions: [
        Obx(
          () => GestureDetector(
            onTap: () {
              Get.to(
                () => VideoCallscreen(
                  name: chatName,
                ),
              );
            },
            child: Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/icons/video.png"),
              height: 25,
              color: isDarkMode.value ? Colors.white70 : Colors.black87,
            ).paddingAll(Get.height * 0.008),
          ),
        ),
        10.width,
        Obx(
          () => GestureDetector(
            onTap: () {
              Get.to(
                () => Callscreen(
                  name: chatName,
                  image: imagePath,
                ),
              );
            },
            child: Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/icons/telephone.png"),
              height: 21,
              color: isDarkMode.value ? Colors.white70 : Colors.black87,
            ).paddingAll(Get.height * 0.008),
          ).paddingOnly(right: Get.width * 0.04),
        )
      ],
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildImageMessage("${BaseUrl}/images/adoptify/cat/cat2.jpg", "Mochi", true, context),
                _buildMessage("Hello. I want to adopt Mochi", true, context),
                _buildMessage("Hi, of course. You can come directly to our address to see and adopt Mochi", false, context),
                _buildMessage("Before I adopt Mochi, can I call you to see Mochi's current condition?", true, context),
                _buildMessage("Sure, we can call now so you can see Mochi?", false, context),
              ],
            ),
          ),
          _buildTextField(context),
        ],
      ),
    );
  }

  Widget _buildMessage(
    String message,
    bool isSender,
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender)
            CircleAvatar(
              backgroundImage: NetworkImage(imagePath ?? ''),
              radius: 20,
            ),
          SizedBox(width: 8),
          Container(
            constraints: BoxConstraints(maxWidth: Get.width * 0.65),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSender ? primaryColor : context.cardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: primaryTextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                    size: 20,
                  ),
                ),
                Text(
                  '12:34 PM',
                  style: secondaryTextStyle(
                    size: 15,
                    color: isDarkMode.value ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          8.width,
          if (isSender)
            CircleAvatar(
              backgroundImage: NetworkImage("${BaseUrl}/images/adoptify/person/person2.jpg"),
              radius: 20,
            ),
        ],
      ),
    );
  }

  Widget _buildImageMessage(String imagePath, String caption, bool isSender, BuildContext context) {
    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender)
            CircleAvatar(
              backgroundImage: NetworkImage(imagePath),
              radius: 20,
            ),
          Container(
            height: Get.height * 0.28,
            decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.6,
                  height: Get.height * 0.21,
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage("${BaseUrl}/images/adoptify/cat/cat2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  caption,
                  style: TextStyle(
                    fontSize: 20,
                    color: isDarkMode.value ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ).paddingAll(Get.height * 0.01),
          ),
          if (isSender)
            CircleAvatar(
              backgroundImage: NetworkImage("${BaseUrl}/images/adoptify/person/person2.jpg"),
              radius: 20,
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: isDarkMode.value ? Color.fromARGB(221, 16, 16, 16) : const Color.fromARGB(97, 230, 217, 217), borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.text,
              style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 20),
              cursorColor: primaryColor,
              decoration: InputDecoration(
                fillColor: context.cardColor,
                filled: true,
                hintText: "Type your message...",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Image(
                    image: NetworkImage("${BaseUrl}/images/adoptify/icons/smile.png"),
                    height: 20,
                    color: isDarkMode.value ? white : black,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Image(
                    image: NetworkImage("${BaseUrl}/images/adoptify/icons/paper-clip.png"),
                    height: 20,
                    color: isDarkMode.value ? white : black,
                  ),
                ),
              ),
              minLines: 1,
              maxLines: 5,
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
              child: Image(
                image: NetworkImage("${BaseUrl}/images/adoptify/icons/send.png"),
                height: 30,
                color: white,
              ).paddingAll(Get.height * 0.015),
            ),
          ),
        ],
      ),
    );
  }
}
