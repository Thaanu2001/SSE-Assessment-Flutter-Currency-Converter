import 'package:get/get.dart';

import '../../constants/string_constrants.dart';
import '../../controllers/home/home_controller.dart';

class InitialBindings {
  InitialBindings() {
    Get.lazyPut<HomeController>(() => HomeController(), tag: homeControllerTag);
  }
}
