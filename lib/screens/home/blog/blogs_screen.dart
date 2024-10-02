import 'package:adoptify/main.dart';
import 'package:adoptify/screens/home/blog/blog_list.dart';
import 'package:adoptify/screens/home/blog/blog_model.dart';
import 'package:adoptify/screens/home/blog/blogs_controller.dart';
import 'package:adoptify/screens/home/blog/component/blog_item.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class Blogs extends StatelessWidget {
  final BlogController blogsController = Get.put(BlogController());
  late final List<BlogItem> items;

  Blogs({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Get.height * 0.52,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blogs",
                  style: primaryTextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(() => BlogsviewAll(items: blogsController.items.toList())),
                  child: Row(
                    children: [
                      Text(
                        'View All',
                        style: secondaryTextStyle(
                          color: primaryColor,
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                      ),
                      5.width,
                      Icon(
                        Icons.arrow_right_alt,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 10),
            BlogsItem()
          ],
        ).paddingOnly(
          right: 8,
          left: 8,
        ),
      ),
    );
  }
}
