class DateMethods {
  static List<DateTime> get generateDatePills {
    DateTime today = DateTime.now();
    DateTime endDate = today.add(const Duration(days: 10));

    List<DateTime> dateList = List.generate(
      endDate.difference(today).inDays + 1,
      (index) => today.add(Duration(days: index)),
    );

    return dateList;
  }

  static String getDiff(DateTime from, DateTime to) {
    Duration diff = to.difference(from);
    int days = diff.inDays;
    int hours = diff.inHours % 24;
    int minutes = diff.inMinutes % 60;
    return "- ${days >= 1 ? '$days d ' : ''}${hours >= 1 ? '$hours h ' : ''}${minutes >= 1 ? '$minutes min' : ''} -";
  }
}
