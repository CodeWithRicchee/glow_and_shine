import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_view.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/signup_view.dart';
import '../../features/auth/views/otp_view.dart';
import '../../features/home/bindings/home_binding.dart';
import '../../features/home/views/home_view.dart';
import '../../features/events/bindings/events_binding.dart';
import '../../features/events/views/events_view.dart';
import '../../features/events/views/event_detail_view.dart';
import '../../features/beautician/bindings/beautician_binding.dart';
import '../../features/beautician/views/beautician_profile_view.dart';
import '../../features/booking/bindings/booking_binding.dart';
import '../../features/booking/views/booking_view.dart';
import '../../features/search/bindings/search_binding.dart';
import '../../features/search/views/search_view.dart';
import '../../features/my_bookings/bindings/my_bookings_binding.dart';
import '../../features/my_bookings/views/my_bookings_view.dart';
import '../../features/profile/bindings/profile_binding.dart';
import '../../features/profile/views/profile_view.dart';
import '../../features/profile/views/edit_profile_view.dart';
import '../../features/reviews/bindings/reviews_binding.dart';
import '../../features/reviews/views/reviews_view.dart';
import '../../features/reviews/views/write_review_view.dart';
import '../../features/notifications/bindings/notifications_binding.dart';
import '../../features/notifications/views/notifications_view.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.splash;

  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.events,
      page: () => const EventsView(),
      binding: EventsBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.eventDetail,
      page: () => const EventDetailView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.beauticianProfile,
      page: () => const BeauticianProfileView(),
      binding: BeauticianBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.booking,
      page: () => const BookingView(),
      binding: BookingBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.myBookings,
      page: () => const MyBookingsView(),
      binding: MyBookingsBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.reviews,
      page: () => const ReviewsView(),
      binding: ReviewsBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.writeReview,
      page: () => const WriteReviewView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
