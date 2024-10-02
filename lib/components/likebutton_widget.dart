import 'package:adoptify/components/likebutton_controller.dart';
import 'package:adoptify/screens/pets/model/pets_model.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class LikeButton extends StatelessWidget {
  final PetsModel pet;
  final LikeController _likeController;

  LikeButton({
    Key? key,
    required this.pet,
  })  : _likeController = Get.put(LikeController(pet), tag: pet.id),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _likeController.toggleLike();
      },
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
        child: Obx(
          () => Padding(
            padding: EdgeInsets.all(8),
            child: Image.network(
              _likeController.isFavorited.value ? "${BaseUrl}/images/adoptify/icons/heartfill.png" : "${BaseUrl}/images/adoptify/icons/heart2.png",
              color: Colors.white,
              height: 22,
            ),
          ),
        ),
      ),
    );
  }
}
