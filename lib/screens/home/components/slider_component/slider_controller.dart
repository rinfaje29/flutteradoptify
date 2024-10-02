import 'package:adoptify/screens/home/components/slider_component/model/slider_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';

class SliderController extends GetxController {
  final CarouselController carouselController = CarouselController();
  RxList<SliderModel> imageList = RxList([
    SliderModel(
      description: "See how you can find friends who are a match for you",
      title: "Just About to Adopt Dogs?",
      image: "${BaseUrl}/images/adoptify/icons/dog_dash.png",
    ),
    SliderModel(
      description: "See how you can find friends who are a match for you",
      title: "Just About to Adopt Cats?",
      image: "${BaseUrl}/images/adoptify/pets/cat.png",
    )
  ]);
  RxInt currentindex = 0.obs;
}
