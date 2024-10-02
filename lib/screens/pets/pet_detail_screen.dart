import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/components/likebutton_widget.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/home/home_controller.dart';
import 'package:adoptify/screens/owner_screen/owner_detail.dart';
import 'package:adoptify/screens/pets/component/you_may_component.dart';
import 'package:adoptify/screens/pets/model/pets_model.dart';
import 'package:adoptify/utils/cached_image_widget.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

import '../../utils/constants.dart';

class PetDetailPage extends StatelessWidget {
  final PetsModel pet;

  const PetDetailPage({Key? key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.put(HomeScreenController());
    final PageController pageController = PageController();

    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Obx(
        () => Text(
          "Pet Details",
          style: TextStyle(fontSize: 18, color: isDarkMode.value ? white : black, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        Obx(
          () => IconButton(
            onPressed: () {
              Share.share('Check out this pet: ${pet.name}. It is a ${pet.breed ?? "breed not specified"}.');
            },
            icon: Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/icons/share.png"),
              color: isDarkMode.value ? white : black,
              height: 18,
            ),
          ),
        ),
        Obx(
          () => IconButton(
            onPressed: () {},
            icon: Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/icons/more.png"),
              color: isDarkMode.value ? white : black,
              height: 18,
            ),
          ),
        )
      ],
      body: Obx(
        () {
          final petImages = [pet.image, pet.image2, pet.image3].where((image) => image != null).toList();

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primaryColor.withOpacity(0.5),
                      ),
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: petImages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: primaryColor.withOpacity(0.5),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedImageWidget(
                                    url: petImages[index]!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            onPageChanged: (index) {
                              controller.imageindex.value = index;
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Obx(() => Container(
                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "${controller.imageindex.value + 1} / ${petImages.length}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    Row(
                      children: [
                        Text(
                          pet.name,
                          style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
                        ),
                        10.width,
                        Row(
                          children: [
                            Text(
                              '(',
                              style: secondaryTextStyle(
                                color: isDarkMode.value ? Colors.white54 : Colors.black54,
                              ),
                            ),
                            LimitedBox(
                              maxWidth: Get.width * 0.45,
                              child: Text(
                                ' ${pet.breed ?? ""}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(
                                  color: isDarkMode.value ? Colors.white54 : Colors.black54,
                                ),
                              ),
                            ),
                            Text(
                              ')',
                              style: secondaryTextStyle(
                                color: isDarkMode.value ? Colors.white54 : Colors.black54,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    10.height,
                    Row(
                      children: [
                        Image(
                          image: NetworkImage("${BaseUrl}/images/adoptify/icons/pin.png"),
                          height: 18,
                          color: primaryColor,
                        ),
                        10.width,
                        Text(
                          pet.distance ?? "",
                          style: secondaryTextStyle(
                            color: isDarkMode.value ? Colors.white54 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height * 0.13,
                          width: Get.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isDarkMode.value ? primaryColor.withOpacity(0.2) : primaryColor.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Gender",
                                style: primaryTextStyle(color: isDarkMode.value ? Colors.white54 : Colors.black54, size: 18),
                              ),
                              10.height,
                              Text(
                                pet.gender ?? "",
                                style: secondaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: Get.height * 0.13,
                          width: Get.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isDarkMode.value ? blueColor.withOpacity(0.2) : blueColor.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Age",
                                style: primaryTextStyle(color: isDarkMode.value ? Colors.white54 : Colors.black54, size: 18),
                              ),
                              10.height,
                              Text(
                                pet.age ?? "",
                                style: secondaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: Get.height * 0.13,
                          width: Get.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isDarkMode.value ? greenColor.withOpacity(0.2) : greenColor.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Size",
                                style: primaryTextStyle(color: isDarkMode.value ? Colors.white54 : Colors.black54, size: 18),
                              ),
                              10.height,
                              Text(
                                pet.size ?? "",
                                style: secondaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    20.height,
                    GestureDetector(
                      onTap: () {
                        Get.to(() => OwnerDetail());
                      },
                      child: Container(
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          color: context.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SettingItemWidget(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage("${BaseUrl}/images/adoptify/message/5.jpg"),
                          ),
                          title: "Happy Tails Animal Rescue",
                          titleTextStyle: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18),
                          subTitle: "123 Paws Street, NYC, NY 10001",
                          subTitleTextStyle: secondaryTextStyle(
                            color: isDarkMode.value ? Colors.white54 : Colors.black54,
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Image(
                              image: NetworkImage("${BaseUrl}/images/adoptify/icons/send.png"),
                              height: 25,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    40.height,
                    YouMayAlsoLike(),
                    80.height
                  ],
                ).paddingAll(12),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LikeButton(pet: pet),
                        20.width,
                        AppButton(
                          width: Get.width,
                          elevation: 0,
                          text: "Adopt",
                          textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                          color: primaryColor,
                          shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onTap: () {},
                        ).paddingSymmetric(vertical: 20).expand(),
                      ],
                    ).paddingSymmetric(horizontal: 16)),
              ),
            ],
          );
        },
      ),
    );
  }
}
