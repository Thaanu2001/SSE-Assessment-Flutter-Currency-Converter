import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../components/custom_dropdown_field.dart';
import '../../../components/custom_text_field.dart';
import '../../../constants/string_constrants.dart';
import '../../../constants/theme_constants.dart';
import '../../../controllers/home/home_controller.dart';

class InputTextField extends GetView<HomeController> {
  const InputTextField({super.key});

  @override
  String? get tag => homeControllerTag;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppTheme.greyShade1,
          borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
        ),
        child: Row(
          children: [
            const SizedBox(width: 4),
            Expanded(
              child: CustomTextField(
                controller: controller.amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputFormatter: FilteringTextInputFormatter.allow(
                  RegExp(r'^(\d+)?\.?\d{0,4}'),
                ),
                onChanged: (val) => controller.updateAllCurrencyValues(),
              ),
            ),
            SizedBox(
              width: 140,
              child: CustomDropdownField(
                items: controller.currencyList.entries.map(
                  (currency) {
                    return DropdownMenuItem(
                      value: currency.key,
                      child: Text(
                        currency.value,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppTheme.primaryColor,
                          height: 1.4,
                        ),
                      ),
                    );
                  },
                ).toList(),
                contentPadding: const EdgeInsets.only(
                  left: 14,
                  top: 12,
                  bottom: 12,
                  right: 14,
                ),
                value: controller.selectedCurrencies[0],
                onChanged: (String? value) {
                  controller.updateSelectedCurrency(value!, 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
