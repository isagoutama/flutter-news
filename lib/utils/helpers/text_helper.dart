import 'package:intl/intl.dart';

class TextHelper {
  TextHelper._();
  static String dateFormat(String date, {String format = "dd MMM yyyy"}) {
    return DateFormat(format).format(DateTime.parse(date));
  }
}
