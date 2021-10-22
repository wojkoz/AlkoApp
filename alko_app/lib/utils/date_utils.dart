String getFormattedDateForItem(DateTime time) {
  String minute = time.minute < 10 ? "0${time.minute}" : time.minute.toString();
  String hour = time.hour < 10 ? "0${time.hour}" : time.hour.toString();

  return "${time.day}/${time.month}/${time.year} $hour:$minute";
}
