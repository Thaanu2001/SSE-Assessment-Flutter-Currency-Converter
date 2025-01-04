import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/currency.dart';
import 'currency_service.dart';

class CurrencyServiceImpl extends CurrencyService {
  @override
  Future<List<Currency>> fetchCurrencyValues({required baseCode}) async {
    return await http
        .get(Uri.parse(
      'https://v6.exchangerate-api.com/v6/37c2906b1c97f3d690d43608/latest/$baseCode',
    ))
        .then((response) {
      if (response.statusCode == 200) {
        final data = (jsonDecode(response.body)
            as Map<String, dynamic>)['conversion_rates'];

        final List<Currency> currencies = (data as Map<String, dynamic>)
            .entries
            .map((entry) => Currency(
                  name: entry.key,
                  value: entry.value.toDouble(),
                ))
            .toList();
        return currencies;
      } else {
        throw Exception('Failed to load currencies');
      }
    });
  }

  @override
  Future<void> saveSelectedCurrencies(List<String> selectedCurrencies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedCurrencies', selectedCurrencies);
  }

  @override
  Future<List<String>> getSelectedCurrencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('selectedCurrencies') ?? [];
  }
}
