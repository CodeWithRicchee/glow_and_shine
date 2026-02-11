import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../data/models/beautician_model.dart';
import '../../../data/models/event_category_model.dart';
import '../../../data/models/offer_model.dart';

class HomeController extends GetxController {
  final isLoading = true.obs;
  final currentNavIndex = 0.obs;
  final currentCarouselIndex = 0.obs;
  final featuredBeauticians = <BeauticianModel>[].obs;
  final eventCategories = <EventCategoryModel>[].obs;
  final offers = <OfferModel>[].obs;
  final trendingLooks = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 800));

    featuredBeauticians.value = [
      BeauticianModel(id: '1', name: 'Sophia Laurent', specialty: 'Bridal Makeup Artist', imageUrl: 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?w=400', rating: 4.9, reviewCount: 234, experienceYears: 8, pricePerHour: 150, location: 'New York', bio: 'Award-winning bridal makeup artist', isFeatured: true),
      BeauticianModel(id: '2', name: 'Emma Chen', specialty: 'Hair Stylist', imageUrl: 'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=400', rating: 4.8, reviewCount: 189, experienceYears: 6, pricePerHour: 120, location: 'Los Angeles', bio: 'Celebrity hair stylist', isFeatured: true),
      BeauticianModel(id: '3', name: 'Aria Williams', specialty: 'Skincare Expert', imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=400', rating: 4.7, reviewCount: 156, experienceYears: 10, pricePerHour: 130, location: 'Miami', bio: 'Board-certified esthetician', isFeatured: true),
      BeauticianModel(id: '4', name: 'Isabella Rose', specialty: 'Nail Artist', imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400', rating: 4.9, reviewCount: 312, experienceYears: 7, pricePerHour: 90, location: 'Chicago', bio: 'Nail art specialist', isFeatured: true),
    ];

    eventCategories.value = [
      EventCategoryModel(id: '1', name: 'Wedding', icon: Iconsax.heart, description: 'Bridal beauty services', imageUrl: 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400', beauticianCount: 25),
      EventCategoryModel(id: '2', name: 'Fashion', icon: Iconsax.magic_star, description: 'Runway & editorial looks', imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400', beauticianCount: 18),
      EventCategoryModel(id: '3', name: 'Corporate', icon: Iconsax.briefcase, description: 'Professional looks', imageUrl: 'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?w=400', beauticianCount: 12),
      EventCategoryModel(id: '4', name: 'Prom', icon: Iconsax.crown, description: 'Prom night glam', imageUrl: 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400', beauticianCount: 20),
      EventCategoryModel(id: '5', name: 'Engagement', icon: Iconsax.gift, description: 'Engagement party looks', imageUrl: 'https://images.unsplash.com/photo-1515934751635-c81c6bc9a2d8?w=400', beauticianCount: 15),
      EventCategoryModel(id: '6', name: 'Festival', icon: Iconsax.music, description: 'Bold festival looks', imageUrl: 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=400', beauticianCount: 16),
      EventCategoryModel(id: '7', name: 'Photoshoot', icon: Iconsax.camera, description: 'Camera-ready beauty', imageUrl: 'https://images.unsplash.com/photo-1516914943479-89db7d9ae7f2?w=400', beauticianCount: 14),
      EventCategoryModel(id: '8', name: 'Everyday Glam', icon: Iconsax.star, description: 'Daily beauty routines', imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?w=400', beauticianCount: 22),
    ];

    offers.value = [
      OfferModel(id: '1', title: 'Bridal Season Special', description: 'Get 25% off on all bridal packages', discountPercent: 25, code: 'BRIDE25', imageUrl: 'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=600', validUntil: DateTime.now().add(const Duration(days: 30))),
      OfferModel(id: '2', title: 'New User Offer', description: 'First booking 20% off', discountPercent: 20, code: 'WELCOME20', imageUrl: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=600', validUntil: DateTime.now().add(const Duration(days: 14))),
      OfferModel(id: '3', title: 'Weekend Treat', description: '15% off on weekend appointments', discountPercent: 15, code: 'WEEKEND15', imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?w=600', validUntil: DateTime.now().add(const Duration(days: 60))),
    ];

    trendingLooks.value = [
      'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?w=300',
      'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?w=300',
      'https://images.unsplash.com/photo-1519699047748-de8e457a634e?w=300',
      'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=300',
      'https://images.unsplash.com/photo-1516914943479-89db7d9ae7f2?w=300',
      'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=300',
    ];

    isLoading.value = false;
  }

  void changeNavIndex(int index) => currentNavIndex.value = index;
}
