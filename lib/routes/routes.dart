import 'package:get/route_manager.dart';

import '../pages/home/home_page.dart';
import 'bindings/home_binding.dart';

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
}

class Routes {
  Routes._();

  static const HOME = _Paths.HOME;

  static String get initialRoute => Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
  ];
}
