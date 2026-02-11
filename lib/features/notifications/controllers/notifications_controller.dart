import 'package:get/get.dart';
import '../../../data/models/notification_model.dart';

class NotificationsController extends GetxController {
  final isLoading = true.obs;
  final notifications = <NotificationModel>[].obs;
  final unreadCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    notifications.value = [
      NotificationModel(id: 'n1', title: 'Booking Confirmed', message: 'Your bridal makeup appointment with Alexandra Rose on Jan 20 at 10:00 AM has been confirmed.', type: 'booking', isRead: false, createdAt: DateTime.now().subtract(const Duration(minutes: 30))),
      NotificationModel(id: 'n2', title: 'Special Offer!', message: 'Get 20% off on all wedding packages this month. Use code BRIDE20 at checkout.', type: 'offer', isRead: false, createdAt: DateTime.now().subtract(const Duration(hours: 2))),
      NotificationModel(id: 'n3', title: 'Reminder', message: 'Your appointment with Sofia Belle is tomorrow at 2:00 PM. Don\'t forget!', type: 'reminder', isRead: false, createdAt: DateTime.now().subtract(const Duration(hours: 5))),
      NotificationModel(id: 'n4', title: 'New Review Reply', message: 'Alexandra Rose replied to your review: "Thank you so much for your kind words!"', type: 'review', isRead: true, createdAt: DateTime.now().subtract(const Duration(days: 1))),
      NotificationModel(id: 'n5', title: 'Booking Completed', message: 'Hope you enjoyed your prom glam session! Leave a review to help others.', type: 'booking', isRead: true, createdAt: DateTime.now().subtract(const Duration(days: 2))),
      NotificationModel(id: 'n6', title: 'Welcome to Glow & Shine!', message: 'Start exploring our beauticians and book your first appointment today.', type: 'system', isRead: true, createdAt: DateTime.now().subtract(const Duration(days: 7))),
    ];
    unreadCount.value = notifications.where((n) => !n.isRead).length;
    isLoading.value = false;
  }

  void markAsRead(String id) {
    final idx = notifications.indexWhere((n) => n.id == id);
    if (idx != -1 && !notifications[idx].isRead) {
      notifications[idx] = NotificationModel(
        id: notifications[idx].id,
        title: notifications[idx].title,
        message: notifications[idx].message,
        type: notifications[idx].type,
        isRead: true,
        createdAt: notifications[idx].createdAt,
        actionRoute: notifications[idx].actionRoute,
        actionId: notifications[idx].actionId,
      );
      unreadCount.value = notifications.where((n) => !n.isRead).length;
    }
  }

  void markAllAsRead() {
    notifications.value = notifications.map((n) => NotificationModel(
      id: n.id, title: n.title, message: n.message, type: n.type, isRead: true, createdAt: n.createdAt, actionRoute: n.actionRoute, actionId: n.actionId,
    )).toList();
    unreadCount.value = 0;
  }

  void deleteNotification(String id) {
    notifications.removeWhere((n) => n.id == id);
    unreadCount.value = notifications.where((n) => !n.isRead).length;
  }
}
