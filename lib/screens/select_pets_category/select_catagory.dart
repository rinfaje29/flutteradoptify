import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/components/likebutton_widget.dart';
import 'package:adoptify/generated/assets.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/home/home_controller.dart';
import 'package:adoptify/screens/pets/pet_detail_screen.dart';
import 'package:adoptify/screens/search_screen/search.dart';
import 'package:adoptify/utils/cached_image_widget.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/constants.dart';

class Selectcategory extends StatelessWidget {
  final String categoryName;
  final HomeScreenController _controller = Get.find();

  Selectcategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Obx(
        () => Text(
          categoryName,
          style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
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
            ).paddingRight(25),
          ),
        ),
      ],
      body: Obx(() {
        final petList = _controller.fetchPetList(_controller.selectedPetType.value);

        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 4,
          ),
          itemCount: petList.length,
          itemBuilder: (context, index) {
            final item = petList[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => PetDetailPage(pet: item));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: context.cardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            ),
                          ),
                          height: Get.height * 0.18,
                          width: Get.width * 0.45,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: CachedImageWidget(
                              url: item.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: Get.height * 0.016,
                          bottom: Get.height * 0.12,
                          right: Get.width * 0.02,
                          left: Get.width * 0.3,
                          child: LikeButton(pet: item),
                        ),
                      ],
                    ),
                    Text(
                      item.name ?? "",
                      style: primaryTextStyle(
                        size: 16,
                        weight: FontWeight.w600,
                        color: isDarkMode.value ? white : black,
                      ),
                    ).paddingAll(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          "${BaseUrl}/images/adoptify/icons/pin.png",
                          height: 14,
                          color: primaryColor,
                        ),
                        5.width,
                        Text(
                          item.distance ?? "",
                          style: secondaryTextStyle(
                            size: 14,
                            color: isDarkMode.value ? white : black,
                          ),
                        ).paddingRight(Get.width * 0.006),
                        Text(
                          "-",
                          style: secondaryTextStyle(
                            size: 14,
                            color: isDarkMode.value ? white : black,
                          ),
                        ).paddingRight(Get.width * 0.006),
                        LimitedBox(
                          maxWidth: Get.width * 0.16,
                          child: Text(
                            item.breed ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: secondaryTextStyle(
                              size: 14,
                              color: isDarkMode.value ? white : black,
                            ),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 5),
                  ],
                ),
              ).paddingAll(4),
            );
          },
        );
      }),
    );
  }
}
