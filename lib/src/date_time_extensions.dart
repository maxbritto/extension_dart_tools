extension DateTimeExtensions on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: day == weekday ? 7 : (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
