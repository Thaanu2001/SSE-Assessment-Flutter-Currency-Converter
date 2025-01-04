import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_dropdown_field.dart';
import '../../../constants/string_constrants.dart';
import '../../../constants/theme_constants.dart';
import '../../../controllers/home/home_controller.dart';

class CurrencyResultCard extends GetView<HomeController> {
  final String value;
  final String currency;
  final Function(String?)? onChanged;
  final Function(DismissDirection)? onDismissed;
  const CurrencyResultCard({
    super.key,
    required this.value,
    required this.currency,
    required this.onChanged,
    required this.onDismissed,
  });

  @override
  String? get tag => homeControllerTag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: UniqueKey(),
        onDismissed: onDismissed,
        background: Container(
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: AppTheme.red,
            borderRadius: BorderRadius.circular(
              AppTheme.defaultBorderRadius,
            ),
          ),
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.delete_outline_rounded,
            color: AppTheme.white,
          ),
        ),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppTheme.greyShade1,
            borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryColor,
                  ),
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
                  value: currency,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
