extension DateTimeExtensions on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: day == weekday ? 7 : (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }
}
