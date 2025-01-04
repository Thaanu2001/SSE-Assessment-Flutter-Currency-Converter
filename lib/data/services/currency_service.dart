import 'package:code94_labs_sse_assignment/data/models/currency.dart';

abstract class CurrencyService {
  Future<List<Currency>> fetchCurrencyValues({required baseCode});

  Future<void> saveSelectedCurrencies(List<String> selectedCurrencies);

  Future<List<String>> getSelectedCurrencies();
}
