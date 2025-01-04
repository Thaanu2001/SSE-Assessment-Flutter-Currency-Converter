import 'package:get/get.dart';

import '../../constants/string_constrants.dart';
import '../../controllers/home/home_controller.dart';
import '../../data/services/currency_service.dart';
import '../../data/services/currency_service_impl.dart';

class InitialBindings {
  InitialBindings() {
    Get.lazyPut<CurrencyService>(
      () => CurrencyServiceImpl(),
      tag: currencyServiceTag,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      tag: homeControllerTag,
    );
  }
}
