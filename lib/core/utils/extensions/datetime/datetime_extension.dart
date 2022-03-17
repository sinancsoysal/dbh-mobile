extension DateTimeExtension on DateTime{
  String get dateTimeToString=>"${_timeValueWithZero(day)}/${_timeValueWithZero(month)}/${_timeValueWithZero(year)} ${_timeValueWithZero(hour)}:${_timeValueWithZero(minute)}";
  String get dateTimeToStringWithTimeZone=>"$dateTimeToString $timeZoneName";
  String get localDateTimeToString=>toLocal().dateTimeToString;


  String _timeValueWithZero(int value)=>"${value>9?"":"0"}$value";
}
