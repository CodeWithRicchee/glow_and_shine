class BookingModel {
  final String id;
  final String userId;
  final String beauticianId;
  final String beauticianName;
  final String beauticianImage;
  final String serviceName;
  final double totalPrice;
  final DateTime dateTime;
  final int durationMinutes;
  final String status;
  final String? eventType;
  final String? notes;

  BookingModel({
    required this.id,
    required this.userId,
    required this.beauticianId,
    required this.beauticianName,
    required this.beauticianImage,
    required this.serviceName,
    required this.totalPrice,
    required this.dateTime,
    required this.durationMinutes,
    required this.status,
    this.eventType,
    this.notes,
  });

  bool get isUpcoming => status == 'confirmed' || status == 'pending';
  bool get isPast => status == 'completed';
  bool get isCancelled => status == 'cancelled';

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json['id'] ?? '',
    userId: json['user_id'] ?? '',
    beauticianId: json['beautician_id'] ?? '',
    beauticianName: json['beautician_name'] ?? '',
    beauticianImage: json['beautician_image'] ?? '',
    serviceName: json['service_name'] ?? '',
    totalPrice: (json['total_price'] ?? 0).toDouble(),
    dateTime: DateTime.parse(json['date_time']),
    durationMinutes: json['duration_minutes'] ?? 0,
    status: json['status'] ?? 'pending',
    eventType: json['event_type'],
    notes: json['notes'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'beautician_id': beauticianId,
    'beautician_name': beauticianName,
    'beautician_image': beauticianImage,
    'service_name': serviceName,
    'total_price': totalPrice,
    'date_time': dateTime.toIso8601String(),
    'duration_minutes': durationMinutes,
    'status': status,
    'event_type': eventType,
    'notes': notes,
  };
}
