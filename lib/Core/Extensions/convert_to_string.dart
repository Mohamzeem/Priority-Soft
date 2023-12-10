import 'package:intl/intl.dart';

extension ConvertToString on String {
  String dateFormatToString() {
    DateTime now = DateTime.now();
    return DateFormat('MM,dd,yyyy, HH:mm:ss').format(now);
  }
}
