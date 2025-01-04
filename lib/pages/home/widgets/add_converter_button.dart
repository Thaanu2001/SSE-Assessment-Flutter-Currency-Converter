import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/string_constrants.dart';
import '../../../constants/theme_constants.dart';
import '../../../controllers/home/home_controller.dart';

class AddConverterButton extends GetView<HomeController> {
  const AddConverterButton({super.key});

  @override
  String? get tag => homeControllerTag;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
          color: AppTheme.green.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
        ),
        child: InkWell(
          child: const Text(
            '+ ADD CONVERTER',
            style: TextStyle(
              color: AppTheme.green,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => controller.addCurrency(),
        ),
      ),
    );
  }
}
