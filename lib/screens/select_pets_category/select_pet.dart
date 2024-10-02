import 'package:adoptify/main.dart';
import 'package:adoptify/screens/home/home_controller.dart';
import 'package:adoptify/screens/select_pets_category/select_catagory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class SelectPetsCatagory extends StatelessWidget {
  final HomeScreenController _controller = Get.put(HomeScreenController());

  SelectPetsCatagory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: _controller.pet.length,
        itemBuilder: (BuildContext context, int index) {
          final pet = _controller.pet[index];
          return Obx(
            () => GestureDetector(
              onTap: () {
                _controller.selectedPetType.value = index;
                Get.to(() => Selectcategory(categoryName: pet.name));
                print(_controller.selectedPetType.value);
              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.067,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: lightGrey, width: Get.width * 0.001)),
                      child: Image(
                        image: NetworkImage(pet.image),
                        height: 80,
                      ).paddingAll(Get.height * 0.01),
                    ),
                    10.height,
                    Text(
                      pet.name,
                      style: primaryTextStyle(color: isDarkMode.value ? white : black, weight: FontWeight.w600, size: 14),
                    ),
                  ],
                ),
              ).paddingAll(Get.width * 0.01),
            ),
          );
        },
      ),
    );
  }
}
