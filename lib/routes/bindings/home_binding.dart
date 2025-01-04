import 'package:get/get.dart';

import '../../constants/string_constrants.dart';
import '../../controllers/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), tag: homeControllerTag);
  }
}
