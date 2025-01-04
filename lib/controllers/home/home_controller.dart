import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/string_constrants.dart';
import '../../data/models/currency.dart';
import '../../data/services/currency_service.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final CurrencyService service = Get.find<CurrencyService>(
    tag: currencyServiceTag,
  );

  TextEditingController amountController = TextEditingController(text: '1');

  final Map<String, String> currencyList = {
    'LKR': '🇱🇰 LKR',
    'USD': '🇺🇸 USD',
    'EUR': '🇪🇺 EUR',
    'GBP': '🇬🇧 GBP',
    'INR': '🇮🇳 INR',
    'JPY': '🇯🇵 JPY',
    'CNY': '🇨🇳 CNY',
    'RUB': '🇷🇺 RUB',
    'KRW': '🇰🇷 KRW',
  };

  RxList<String> selectedCurrencies = <String>[
    'LKR',
  ].obs;

  RxList<String> convertedValues = <String>[
    '1',
  ].obs;

  RxList<Currency> currencyValues = <Currency>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSelectedCurrencies();
  }

  void updateSelectedCurrency(String currency, int index) {
    selectedCurrencies[index] = currency;
    saveSelectedCurrencies();
    fetchCurrencyValues();
  }

  void addCurrency() {
    selectedCurrencies.add('USD');
    saveSelectedCurrencies();
    fetchCurrencyValues();
  }

  void removeCurrency(int index) {
    selectedCurrencies.removeAt(index);
    saveSelectedCurrencies();
    convertedValues.removeAt(index);
  }

  Future<void> fetchCurrencyValues() async {
    try {
      currencyValues.clear();

      final List<Currency> currencies = await service.fetchCurrencyValues(
        baseCode: selectedCurrencies.first,
      );

      currencyValues.assignAll(currencies);
      updateAllCurrencyValues();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load currencies',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String currencyConvert(int index) {
    if (currencyValues.isEmpty) return '';
    final currency = selectedCurrencies[index];
    final value =
        currencyValues.firstWhere((element) => element.name == currency).value;
    final amount = double.tryParse(amountController.text) ?? 1;

    return NumberFormat('###,###.####').format(value * amount);
  }

  void updateAllCurrencyValues() {
    if (amountController.text.isEmpty) {
      convertedValues.clear();
      convertedValues.assignAll(
        List.generate(
          selectedCurrencies.length,
          (index) => index == 0 ? '1' : '',
        ),
      );
    } else {
      convertedValues.clear();
      convertedValues.assignAll(
        List.generate(
          selectedCurrencies.length,
          (index) => currencyConvert(index),
        ),
      );
    }
  }

  saveSelectedCurrencies() {
    try {
      service.saveSelectedCurrencies(selectedCurrencies);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save currencies locally',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> getSelectedCurrencies() async {
    try {
      final List<String> currencies = await service.getSelectedCurrencies();
      if (currencies.isEmpty) {
        selectedCurrencies.assignAll(['LKR', 'USD']);
        saveSelectedCurrencies();
        fetchCurrencyValues();
        return;
      }
      selectedCurrencies.assignAll(currencies);
      fetchCurrencyValues();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load currencies locally',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
