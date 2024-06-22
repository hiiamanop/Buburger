import 'package:intl/intl.dart';

class Config {
  // membuat fungsi currency
  static String convertToIDR(dynamic nominal, int decimalDigits) {
    NumberFormat currencyFormater = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR',
      decimalDigits: decimalDigits 
    );

    return currencyFormater.format(nominal);
  }
}
