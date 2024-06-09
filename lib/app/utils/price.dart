import 'package:intl/intl.dart';

class Price {
  String price(int price, String? symbol) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: symbol ?? 'IDR ',
      decimalDigits: 0,
    ).format(price).toString();
  }
}
