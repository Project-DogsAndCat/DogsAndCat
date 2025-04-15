String calculatingAge(DateTime date) {
  DateTime today = DateTime.now();

  DateTime lastBirthday;
  try {
    lastBirthday = DateTime(today.year, date.month, date.day);
  } catch (e) {
    lastBirthday = DateTime(today.year, date.month, date.day - 1);
  }

  if (lastBirthday.isAfter(today)) {
    lastBirthday = DateTime(today.year - 1, date.month, date.day);
    try {
      lastBirthday = DateTime(today.year - 1, date.month, date.day);
    } catch (e) {
      lastBirthday = DateTime(today.year - 1, date.month, date.day - 1);
    }
  }

  int years = lastBirthday.year - date.year;

  int totalMonths = (today.year - lastBirthday.year) * 12 +
      (today.month - lastBirthday.month);
  if (today.day < date.day) {
    totalMonths--;
  }

  if (totalMonths < 0) {
    totalMonths += 12;
    years--;
  }

  String yearStr = _formatingYear(years);
  return '$yearStr $totalMonths мес.';
}

String _formatingYear(int year) {
  if (year % 10 == 1 && year != 11) return '$year год';
  if (year % 10 > 1 && year % 10 < 5) {
    return '$year года';
  } else {
    return '$year лет';
  }
}
