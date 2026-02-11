import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../data/models/beautician_model.dart';
import '../../../data/models/event_category_model.dart';
import '../../../data/models/service_model.dart';

class EventsController extends GetxController {
  final isLoading = true.obs;
  final categories = <EventCategoryModel>[].obs;
  final selectedCategory = Rxn<EventCategoryModel>();
  final categoryServices = <ServiceModel>[].obs;
  final categoryBeauticians = <BeauticianModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    categories.value = [
      EventCategoryModel(id: '1', name: 'Wedding', icon: Iconsax.heart, description: 'Complete bridal beauty packages', imageUrl: 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400', beauticianCount: 25),
      EventCategoryModel(id: '2', name: 'Fashion', icon: Iconsax.magic_star, description: 'Runway & editorial looks', imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400', beauticianCount: 18),
      EventCategoryModel(id: '3', name: 'Corporate', icon: Iconsax.briefcase, description: 'Polished professional looks', imageUrl: 'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?w=400', beauticianCount: 12),
      EventCategoryModel(id: '4', name: 'Prom', icon: Iconsax.crown, description: 'Glamorous prom night looks', imageUrl: 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400', beauticianCount: 20),
      EventCategoryModel(id: '5', name: 'Engagement', icon: Iconsax.gift, description: 'Engagement party beauty', imageUrl: 'https://images.unsplash.com/photo-1515934751635-c81c6bc9a2d8?w=400', beauticianCount: 15),
      EventCategoryModel(id: '6', name: 'Festival', icon: Iconsax.music, description: 'Bold & colorful festival looks', imageUrl: 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=400', beauticianCount: 16),
      EventCategoryModel(id: '7', name: 'Photoshoot', icon: Iconsax.camera, description: 'Camera-ready beauty', imageUrl: 'https://images.unsplash.com/photo-1516914943479-89db7d9ae7f2?w=400', beauticianCount: 14),
      EventCategoryModel(id: '8', name: 'Everyday Glam', icon: Iconsax.star, description: 'Elevate your daily look', imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?w=400', beauticianCount: 22),
      EventCategoryModel(id: '9', name: 'Bridal Shower', icon: Iconsax.lovely, description: 'Pre-wedding celebration looks', imageUrl: 'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=400', beauticianCount: 10),
      EventCategoryModel(id: '10', name: 'Birthday', icon: Iconsax.cake, description: 'Birthday celebration glam', imageUrl: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=400', beauticianCount: 18),
      EventCategoryModel(id: '11', name: 'Anniversary', icon: Iconsax.heart_tick, description: 'Anniversary date night beauty', imageUrl: 'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?w=400', beauticianCount: 12),
      EventCategoryModel(id: '12', name: 'Red Carpet', icon: Iconsax.award, description: 'Award-show worthy looks', imageUrl: 'https://images.unsplash.com/photo-1519699047748-de8e457a634e?w=400', beauticianCount: 8),
    ];
    isLoading.value = false;
  }

  Future<void> loadCategoryDetails(EventCategoryModel category) async {
    selectedCategory.value = category;
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    categoryServices.value = [
      ServiceModel(id: '1', name: '${category.name} Makeup', description: 'Full ${category.name.toLowerCase()} makeup look', price: 250, durationMinutes: 90, category: 'Makeup', isPopular: true),
      ServiceModel(id: '2', name: '${category.name} Hair Styling', description: 'Elegant hair styling for ${category.name.toLowerCase()}', price: 150, durationMinutes: 60, category: 'Hair'),
      ServiceModel(id: '3', name: '${category.name} Nails', description: 'Themed nail art', price: 80, durationMinutes: 45, category: 'Nails'),
      ServiceModel(id: '4', name: '${category.name} Package', description: 'Complete beauty package', price: 400, durationMinutes: 150, category: 'Package', isPopular: true),
    ];
    categoryBeauticians.value = [
      BeauticianModel(id: '1', name: 'Sophia Laurent', specialty: '${category.name} Specialist', imageUrl: 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?w=400', rating: 4.9, reviewCount: 234, experienceYears: 8, pricePerHour: 150, location: 'New York', bio: ''),
      BeauticianModel(id: '2', name: 'Emma Chen', specialty: '${category.name} Expert', imageUrl: 'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=400', rating: 4.8, reviewCount: 189, experienceYears: 6, pricePerHour: 120, location: 'Los Angeles', bio: ''),
      BeauticianModel(id: '3', name: 'Aria Williams', specialty: '${category.name} Artist', imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=400', rating: 4.7, reviewCount: 156, experienceYears: 10, pricePerHour: 130, location: 'Miami', bio: ''),
    ];
    isLoading.value = false;
  }
}
