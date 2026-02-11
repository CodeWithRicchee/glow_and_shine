import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/theme/app_colors.dart';
import '../../my_bookings/views/my_bookings_view.dart';
import '../../profile/views/profile_view.dart';
import '../../search/views/search_view.dart';
import '../controllers/home_controller.dart';
import 'home_dashboard.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final index = controller.currentNavIndex.value;
      Widget body;
      switch (index) {
        case 1:
          body = const SearchView();
          break;
        case 2:
          body = const MyBookingsView();
          break;
        case 3:
          body = const ProfileView();
          break;
        default:
          body = const HomeDashboard();
      }
      return Column(
        children: [
          Expanded(child: body),
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: controller.changeNavIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.roseGold,
              unselectedItemColor: AppColors.coolGrey,
              items: const [
                BottomNavigationBarItem(icon: Icon(Iconsax.home), activeIcon: Icon(Iconsax.home_15), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Iconsax.search_normal), activeIcon: Icon(Iconsax.search_normal_1), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Iconsax.calendar), activeIcon: Icon(Iconsax.calendar_1), label: 'Bookings'),
                BottomNavigationBarItem(icon: Icon(Iconsax.user), activeIcon: Icon(Iconsax.user), label: 'Profile'),
              ],
            ),
          ),
        ],
      );
    });
  }
}
