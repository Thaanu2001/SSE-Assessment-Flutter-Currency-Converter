import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/string_constrants.dart';
import '../../../controllers/home/home_controller.dart';
import 'currency_result_card.dart';

class CurrencyResultList extends GetView<HomeController> {
  const CurrencyResultList({super.key});

  @override
  String? get tag => homeControllerTag;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: controller.selectedCurrencies.length - 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Obx(
            () => CurrencyResultCard(
              value: controller.currencyValues.isEmpty
                  ? ''
                  : controller.convertedValues[index + 1],
              currency: controller.selectedCurrencies[index + 1],
              onChanged: (String? value) {
                controller.updateSelectedCurrency(value!, index + 1);
              },
              onDismissed: (direction) {
                controller.removeCurrency(index + 1);
              },
            ),
          );
        },
      ),
    );
  }
}
