import 'package:fit_track/utils/resources/string_manager.dart';

class Days {
  final String dayName;

  Days(
    this.dayName,
  );
}

List<Days> dayList = [
  Days(StringManager.instance.monday),
  Days(StringManager.instance.tuesday),
  Days(StringManager.instance.wednesday),
  Days(StringManager.instance.thursday),
  Days(StringManager.instance.friday),
  Days(StringManager.instance.saturday),
  Days(StringManager.instance.sunday),
];
