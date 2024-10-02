import 'package:adoptify/main.dart';
import 'package:adoptify/screens/pets/model/pets_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class FavoritePetsController extends GetxController {
  var favoritePets = <PetsModel>[].obs;
  RxString selectedCategory = 'Cats'.obs;

  void addToFavorites(PetsModel pet) {
    if (!favoritePets.contains(pet)) {
      favoritePets.add(pet);
    }
  }

  void removeFromFavorites(PetsModel pet) {
    favoritePets.remove(pet);
  }

  bool isFavorite(PetsModel pet) {
    return favoritePets.contains(pet);
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  var lastBackPressTime = 0.obs;

  bool onWillPop(BuildContext context) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - lastBackPressTime.value < 2000) {
      return true;
    } else {
      lastBackPressTime.value = currentTime;
      Fluttertoast.showToast(
        msg: "Press Back Again to Exit",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: context.cardColor,
        textColor: isDarkMode.value ? white : black,
        fontSize: 16.0,
      );
      return false;
    }
  }
}
