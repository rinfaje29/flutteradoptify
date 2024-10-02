import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/components/likebutton_widget.dart';
import 'package:adoptify/main.dart';
// import 'package:adoptify/screens/dashboard/near_by_pets/pet_detail.dart';
import 'package:adoptify/screens/pets/pet_detail_screen.dart';
import 'package:adoptify/utils/cached_image_widget.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../utils/constants.dart';
import '../pets_nearby_controller.dart';

class PetsNearByGird extends StatelessWidget {
  final NearByPetsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Obx(
        () => Text(
          "Pet Near By",
          style: primaryTextStyle(size: 18, color: isDarkMode.value ? white : black, weight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => GridView.builder(
          padding: EdgeInsets.all(Get.height * 0.02),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 4,
          ),
          itemCount: _controller.nearpet.length,
          itemBuilder: (context, index) {
            final item = _controller.nearpet[index];
            return GestureDetector(
                onTap: () {
                  _controller.selectedNearPetIndex.value = _controller.nearpet.indexOf(item);
                  Get.to(
                    () => PetDetailPage(
                      pet: item,
                    ),
                  );
                },
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.width * 0.45,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: context.cardColor),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              height: Get.height * 0.2,
                              width: Get.width * 0.45,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                child: CachedImageWidget(
                                  url: item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: Get.height * 0.014,
                              bottom: Get.height * 0.14,
                              right: Get.width * 0.02,
                              left: Get.width * 0.28,
                              child: LikeButton(
                                pet: item,
                              ),
                            )
                          ],
                        ),
                        Text(
                          item.name,
                          style: primaryTextStyle(
                            size: 18,
                            weight: FontWeight.w600,
                            color: isDarkMode.value ? white : black,
                          ),
                        ).paddingSymmetric(horizontal: 10, vertical: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              "${BaseUrl}/images/adoptify/icons/pin.png",
                              height: 18,
                              color: primaryColor,
                            ),
                            5.width,
                            Text(
                              item.distance ?? "",
                              style: secondaryTextStyle(
                                size: 14,
                                color: isDarkMode.value ? white : black,
                              ),
                            ),
                            6.width,
                            Text(
                              "-",
                              style: secondaryTextStyle(
                                size: 14,
                                color: isDarkMode.value ? white : black,
                              ),
                            ),
                            6.width,
                            LimitedBox(
                              maxWidth: Get.width * 0.17,
                              child: Text(
                                item.breed ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(
                                  size: 14,
                                  color: isDarkMode.value ? white : black,
                                ),
                              ),
                            ).expand(),
                          ],
                        ).paddingSymmetric(horizontal: 10)
                      ],
                    ),
                  ),
                ).paddingAll(5));
          },
        ),
      ),
    );
  }
}
