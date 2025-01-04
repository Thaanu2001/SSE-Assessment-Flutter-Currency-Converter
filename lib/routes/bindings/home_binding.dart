import 'package:get/get.dart';

import '../../constants/string_constrants.dart';
import '../../controllers/home/home_controller.dart';
import '../../data/services/currency_service.dart';
import '../../data/services/currency_service_impl.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CurrencyService>(CurrencyServiceImpl(), tag: currencyServiceTag);

    Get.put<HomeController>(HomeController(), tag: homeControllerTag);
  }
}
