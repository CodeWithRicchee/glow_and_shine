import 'package:get/get.dart';
import 'local_storage_provider.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.glowandshine.com/v1';
    httpClient.timeout = const Duration(seconds: 30);

    httpClient.addRequestModifier<dynamic>((request) {
      final storage = Get.find<LocalStorageProvider>();
      final token = storage.getToken();
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }
      request.headers['Content-Type'] = 'application/json';
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      if (response.statusCode == 401) {
        Get.find<LocalStorageProvider>().clearToken();
      }
      return response;
    });

    super.onInit();
  }

  // Auth
  Future<Response> login(Map<String, dynamic> body) => post('/auth/login', body);
  Future<Response> signup(Map<String, dynamic> body) => post('/auth/signup', body);
  Future<Response> verifyOtp(Map<String, dynamic> body) => post('/auth/verify-otp', body);

  // Beauticians
  Future<Response> getBeauticians({Map<String, dynamic>? query}) =>
      get('/beauticians', query: query);
  Future<Response> getBeauticianById(String id) => get('/beauticians/$id');
  Future<Response> getFeaturedBeauticians() => get('/beauticians/featured');

  // Bookings
  Future<Response> createBooking(Map<String, dynamic> body) => post('/bookings', body);
  Future<Response> getMyBookings({String? status}) =>
      get('/bookings/me', query: status != null ? {'status': status} : null);
  Future<Response> cancelBooking(String id) => put('/bookings/$id/cancel', {});

  // Services
  Future<Response> getServices({String? category}) =>
      get('/services', query: category != null ? {'category': category} : null);

  // Reviews
  Future<Response> getReviews(String beauticianId) => get('/beauticians/$beauticianId/reviews');
  Future<Response> createReview(Map<String, dynamic> body) => post('/reviews', body);

  // Events
  Future<Response> getEventCategories() => get('/events/categories');
  Future<Response> getEventDetail(String id) => get('/events/$id');

  // Search
  Future<Response> search(String query, {Map<String, dynamic>? filters}) =>
      get('/search', query: {'q': query, ...?filters});

  // Profile
  Future<Response> getProfile() => get('/profile');
  Future<Response> updateProfile(Map<String, dynamic> body) => put('/profile', body);

  // Notifications
  Future<Response> getNotifications() => get('/notifications');
  Future<Response> markNotificationRead(String id) => put('/notifications/$id/read', {});
}
