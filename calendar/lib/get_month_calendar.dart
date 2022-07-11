List<List<int>> getMonthCalendar(int year, int month) {
  var calendar = List.generate(6, (i) => [0, 0, 0, 0, 0, 0, 0], growable: false);

  int current;
	final t = [ 6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 ];
  var mDays = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
  int days;
	int y = year % 100;

  current = y ~/ 12 + y % 12 + y % 12 ~/ 4 + t[month - 1] + (20 - year ~/ 100);
	if ((year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) && month <= 2) current--;
	current = current % 7;

  if (month == 2) {
    if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
      days = 29;
    }
		else {
      days = mDays[month - 1];
    }
  }
  else {
    days = mDays[month - 1];
  }

  int d = 0;
	int i = 0;
	int j = current;
	while (d != days)
	{
		d++;
		calendar[i][j] = d;
		if (j != calendar[0].length - 1) {
      j++;
    }
		else {
			j = 0;
			i++;
		}
	}
		
  return calendar;
}