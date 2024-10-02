import 'package:adoptify/screens/home/blog/blogs_controller.dart';
import 'package:adoptify/screens/home/blog/blogs_detail_screen.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class BlogsItem extends StatelessWidget {
  final BlogController blogsController = Get.put(BlogController());

  BlogsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Obx(() {
            final item = blogsController.items[index];
            return Padding(
              padding: EdgeInsets.all(Get.height * 0.008),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => BlogDetailScreen(
                            title: item.title,
                            subtitle: item.subtitle,
                            date: item.date,
                            time: item.time,
                            image: item.image,
                            paragraph: item.paragraph,
                            summary: item.summary,
                            content: item.content,
                            text: item.text,
                            text2: item.text2,
                          ));
                    },
                    child: Container(
                      height: Get.height * 0.12,
                      width: Get.width * 0.92,
                      decoration: BoxDecoration(
                        color: context.cardColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Hero(
                            tag: item.image ?? "",
                            child: Container(
                              height: Get.height * 0.15,
                              width: Get.width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                child: Image.network(item.image ?? "", fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.6,
                            decoration: BoxDecoration(
                              color: context.cardColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LimitedBox(
                                  maxWidth: Get.width * 0.3,
                                  child: Text(
                                    maxLines: 2,
                                    item.title ?? "",
                                    style: primaryTextStyle(
                                      size: 18,
                                      color: primaryColor,
                                      weight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                LimitedBox(
                                  maxWidth: Get.width * 0.3,
                                  child: Text(
                                    item.subtitle ?? "",
                                    maxLines: 2,
                                    style: secondaryTextStyle(
                                      color: Colors.grey,
                                      weight: FontWeight.bold,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  item.date ?? "",
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ).paddingOnly(
                              left: Get.width * 0.03,
                            ),
                          ).paddingAll(Get.height * 0.004),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
