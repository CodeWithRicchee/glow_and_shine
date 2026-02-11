class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String type;
  final DateTime createdAt;
  final bool isRead;
  final String? actionRoute;
  final String? actionId;

  NotificationModel({required this.id, required this.title, required this.message, required this.type, required this.createdAt, this.isRead = false, this.actionRoute, this.actionId});
}
