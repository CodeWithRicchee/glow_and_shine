class AvailabilityModel {
  final int dayOfWeek;
  final String startTime;
  final String endTime;
  final bool isAvailable;

  AvailabilityModel({required this.dayOfWeek, required this.startTime, required this.endTime, this.isAvailable = true});

  String get dayName {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[dayOfWeek - 1];
  }
}
