import 'package:intl/intl.dart';

extension DateTimeEx on DateTime ? {
  String get ddE => this!=null ? DateFormat('dd E').format(this!) : '';

  String get hhmm => this!=null ? DateFormat.jm().format(this!) : '';
}