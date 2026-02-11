class TimeSlotModel {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final bool isAvailable;
  final bool isBooked;

  TimeSlotModel({required this.id, required this.startTime, required this.endTime, this.isAvailable = true, this.isBooked = false});

  String get formattedTime {
    final hour = startTime.hour;
    final minute = startTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}
