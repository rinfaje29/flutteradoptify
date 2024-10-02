import 'package:adoptify/screens/pets/model/pets_model.dart';
import 'package:adoptify/screens/pets/pet_controller.dart';
import 'package:get/get.dart';

class PetPreferenceController extends GetxController {
  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  RxString selectedCategory = ''.obs;
  final RxInt selectedPetIndex = 0.obs;
  final RxInt imageindex = 0.obs;

  void SelectedPetIndex(int index) {
    selectedPetIndex.value = index;
  }

  final PetController petController = Get.put(PetController());

  RxList<PetsModel> getPetsList() {
    switch (selectedCategory.value) {
      case 'Cats':
        return petController.cat;
      case 'Dogs':
        return petController.dog;
      case 'Birds':
        return petController.bird;
      case 'Horses':
        return petController.horse;
      case 'Rabbits':
        return petController.rabbit;
      case 'Reptiles':
        return petController.reptile;
      case 'Fish':
        return petController.fish;
      case 'Primates':
        return petController.primates;
      default:
        return <PetsModel>[].obs;
    }
  }
}
