import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'constants/theme_constants.dart';
import 'routes/bindings/initial_bindings.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings();
  runApp(Main(initialRoute: Routes.initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: GetMaterialApp(
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        title: "Currency Converter",
        initialRoute: initialRoute,
        getPages: Routes.routes,
        theme: AppTheme.appTheme,
      ),
    );
  }
}
