part of 'functions.dart';

class PriceFormatter {
  String format(int price) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
  }
}
