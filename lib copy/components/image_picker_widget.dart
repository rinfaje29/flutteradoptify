import 'dart:io';

import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/constants.dart';

class ProfileImageSelector extends StatelessWidget {
  final RxString imagePath = ''.obs;

  Future<void> getImage({required ImageSource source}) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: Get.height * 0.07,
                          backgroundImage: imagePath.isNotEmpty ? FileImage(File(imagePath.value)) : NetworkImage("${BaseUrl}/images/adoptify/person/person2.jpg") as ImageProvider,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.09,
                  bottom: Get.height * 0.01,
                  right: Get.width * 0.23,
                  left: Get.width * 0.47,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.camera_alt, color: primaryColor),
                                    title: Text('Camera'),
                                    onTap: () {
                                      getImage(source: ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_library, color: primaryColor),
                                    title: Text('Gallery'),
                                    onTap: () {
                                      getImage(source: ImageSource.gallery);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Image(
                        image: NetworkImage("${BaseUrl}/images/adoptify/icons/edit.png"),
                        color: isDarkMode.value ? blackColor : white,
                        fit: BoxFit.cover,
                        height: 20,
                      ),
                      color: isDarkMode.value ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(Get.height * 0.03),
    );
  }
}
