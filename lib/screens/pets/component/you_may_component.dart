import 'package:adoptify/generated/assets.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/home/components/near_by_pets_component/pets_nearby_controller.dart';
import 'package:adoptify/screens/pets/pet_detail_screen.dart';
import 'package:adoptify/utils/cached_image_widget.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/constants.dart';

class YouMayAlsoLike extends StatelessWidget {
  final NearByPetsController _controller = Get.put(NearByPetsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Text(
            "You May Also Like",
            style: primaryTextStyle(
              color: isDarkMode.value ? Colors.white : Colors.black,
              size: 18,
              weight: FontWeight.bold,
            ),
          ),
        ),
        10.height,
        Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _controller.nearpet.map(
                (item) {
                  return Padding(
                    padding: EdgeInsets.all(Get.height * 0.009),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller.selectedNearPetIndex.value = _controller.nearpet.indexOf(item);
                            Get.to(() => PetDetailPage(pet: item));
                          },
                          child: Container(
                            height: Get.height * 0.29,
                            width: Get.width * 0.45,
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
                                        color: primaryColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                        ),
                                      ),
                                      height: Get.height * 0.2,
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
                                  ],
                                ),
                                10.height,
                                Text(
                                  item.name,
                                  style: primaryTextStyle(
                                    size: 16,
                                    weight: FontWeight.w600,
                                    color: isDarkMode.value ? Colors.white : Colors.black,
                                  ),
                                ).paddingSymmetric(horizontal: 5),
                                10.height,
                                Row(
                                  children: [
                                    Image.network(
                                      "${BaseUrl}/images/adoptify/icons/pin.png",
                                      height: 20,
                                      color: primaryColor,
                                    ),
                                    5.width,
                                    Text(
                                      item.distance ?? "",
                                      style: secondaryTextStyle(
                                        size: 14,
                                        color: isDarkMode.value ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    6.width,
                                    Text(
                                      "-",
                                      style: secondaryTextStyle(
                                        size: 14,
                                        color: isDarkMode.value ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    6.width,
                                    LimitedBox(
                                      maxWidth: Get.width * 0.2,
                                      child: Text(
                                        item.breed ?? "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: secondaryTextStyle(
                                          size: 14,
                                          color: isDarkMode.value ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 5),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
