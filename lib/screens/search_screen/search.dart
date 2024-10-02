import 'package:adoptify/components/appscaffold.dart';
import 'package:adoptify/main.dart';
import 'package:adoptify/screens/pets/model/pets_model.dart';
import 'package:adoptify/screens/search_screen/components/pet_search.dart';
import 'package:adoptify/screens/search_screen/model/search_model.dart';
import 'package:adoptify/screens/search_screen/search_controller.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../generated/assets.dart';

class Search extends StatelessWidget {
  final SearchPetController _controller = Get.put(SearchPetController());

  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Text(
        "Pet Search",
        style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
                ),
                10.height,
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: primaryTextStyle(
                    color: isDarkMode.value ? white : black,
                  ),
                  controller: _controller.locController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    hintText: 'Enter Location',
                    hintStyle: secondaryTextStyle(
                      color: Colors.grey,
                      size: 16,
                      weight: FontWeight.w300,
                    ),
                    fillColor: context.cardColor,
                    filled: true,
                    prefixIcon: Image(
                      image: AssetImage(Assets.iconsLocation),
                      color: isDarkMode.value ? grey : Colors.black45,
                      height: 20,
                    ).paddingAll(16),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                30.height,
                Text(
                  "Pet Types",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
                ),
                10.height,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: _controller.pettype.map<Widget>((PetsModel pettype) {
                    return Obx(
                      () => FilterChip(
                        avatar: Image(image: NetworkImage(pettype.image)),
                        label: Text(
                          pettype.name,
                          style: secondaryTextStyle(color: isDarkMode.value ? white : black, size: 16),
                        ),
                        showCheckmark: false,
                        selected: pettype.selected.value,
                        selectedColor: primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                        onSelected: (bool selected) {
                          _controller.togglePetTypeSelection(pettype);
                          if (selected) {
                            // ignore: unused_local_variable
                            int index = _controller.pettype.indexOf(pettype);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                20.height,
                Text(
                  "Gender",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
                ),
                10.height,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: _controller.gender.map<Widget>((GenderModel gender) {
                    return Obx(
                      () => FilterChip(
                        label: Text(
                          gender.gender ?? "",
                          style: secondaryTextStyle(color: isDarkMode.value ? white : black, size: 18),
                        ),
                        showCheckmark: false,
                        selected: gender.selected.value,
                        selectedColor: primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                        onSelected: (bool selected) {
                          _controller.toggleGenderSelection(gender);
                          if (selected) {
                            // ignore: unused_local_variable
                            int index = _controller.pettype.indexOf(gender);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                20.height,
                Text(
                  "Size",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
                ),
                10.height,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: _controller.size.map<Widget>((SizeModel petsize) {
                    return Obx(
                      () => FilterChip(
                        label: Text(
                          petsize.size ?? "",
                          style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18),
                        ),
                        showCheckmark: false,
                        selected: petsize.selected.value,
                        selectedColor: primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                        onSelected: (bool selected) {
                          _controller.toggleSizeSelection(petsize);
                          if (selected) {
                            // ignore: unused_local_variable
                            int index = _controller.pettype.indexOf(petsize);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                20.height,
                Text(
                  "Age",
                  style: primaryTextStyle(color: isDarkMode.value ? white : black, size: 18, weight: FontWeight.bold),
                ),
                10.height,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: _controller.age.map<Widget>((AgeModel petage) {
                    return Obx(
                      () => FilterChip(
                        label: Text(
                          petage.age ?? "",
                          style: secondaryTextStyle(color: isDarkMode.value ? white : black, size: 18),
                        ),
                        showCheckmark: false,
                        selected: petage.selected.value,
                        selectedColor: primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                        onSelected: (bool selected) {
                          _controller.toggleAgeSelection(petage);
                          if (selected) {
                            // ignore: unused_local_variable
                            int index = _controller.pettype.indexOf(petage);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                120.height,
              ],
            ).paddingAll(Get.height * 0.02),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: Get.width,
                decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                child: AppButton(
                  elevation: 0,
                  text: "Search",
                  textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                  color: primaryColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onTap: () {
                    Get.to(() => SearchResult());
                  },
                ).paddingSymmetric(vertical: 30, horizontal: 16)),
          ),
        ],
      ),
    );
  }
}
