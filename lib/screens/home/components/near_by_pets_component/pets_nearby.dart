import 'package:adoptify/components/likebutton_widget.dart';
import 'package:adoptify/generated/assets.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/home/components/near_by_pets_component/pet_nearby_girdview/pets_nearby_girdv.dart';
// import 'package:adoptify/screens/dashboard/near_by_pets/pet_detail.dart';
import 'package:adoptify/screens/home/components/near_by_pets_component/pets_nearby_controller.dart';
import 'package:adoptify/screens/pets/pet_detail_screen.dart';
import 'package:adoptify/utils/cached_image_widget.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/constants.dart';

class NearByPets extends StatelessWidget {
  final NearByPetsController _controller = Get.put(NearByPetsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pets Near You",
                style: primaryTextStyle(
                  color: isDarkMode.value ? Colors.white : Colors.black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => PetsNearByGird());
                },
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
          ).paddingSymmetric(horizontal: 12),
        ),
        10.height,
        Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _controller.nearpet.map(
                (item) {
                  return Padding(
                    padding: EdgeInsets.all(9),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller.selectedNearPetIndex.value = _controller.nearpet.indexOf(item);
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
                                      height: Get.height * 0.22,
                                      width: Get.width / 2 - 4,
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
                                      top: 10,
                                      right: 10,
                                      child: LikeButton(pet: item),
                                    )
                                  ],
                                ),
                                10.height,
                                Text(
                                  item.name,
                                  style: primaryTextStyle(
                                    size: 18,
                                    weight: FontWeight.w600,
                                    color: isDarkMode.value ? Colors.white : Colors.black,
                                  ),
                                ).paddingSymmetric(horizontal: 10),
                                10.height,
                                Row(
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
                                ).paddingSymmetric(horizontal: 10),
                                12.height,
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
    ).paddingSymmetric(horizontal: 8);
  }
}
