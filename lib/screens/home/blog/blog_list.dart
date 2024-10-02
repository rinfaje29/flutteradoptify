import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/home/blog/blog_model.dart';
import 'package:adoptify/screens/home/blog/blogs_controller.dart';
import 'package:adoptify/screens/home/blog/blogs_detail_screen.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class BlogsviewAll extends StatelessWidget {
  final List<BlogItem> items;

  const BlogsviewAll({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogController blogsController = Get.find<BlogController>();
    return AppScaffold(
      appBarTitle: Text(
        "Blogs",
        style: TextStyle(color: isDarkMode.value ? Colors.white : Colors.black),
      ),
      body: ListView.builder(
        itemCount: blogsController.items.length,
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
                    child: Row(
                      children: [
                        Container(
                          height: Get.height * 0.12, //100,
                          width: Get.width * 0.92, //428,
                          decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Hero(
                                tag: item.image ?? "",
                                child: Container(
                                  height: Get.height * 0.15, //100,
                                  width: Get.width * 0.3, //125,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                    child: Image.network(
                                      item.image ?? "", // Handle null case
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width * 0.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title ?? "",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    LimitedBox(
                                      maxWidth: Get.width * 0.3,
                                      child: Text(
                                        item.subtitle ?? "",
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
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
                                ).paddingAll(
                                  Get.height * 0.005,
                                ),
                              ).paddingOnly(left: Get.width * 0.02),
                            ],
                          ),
                        ),
                      ],
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
