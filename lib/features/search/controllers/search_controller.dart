import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/beautician_model.dart';

class SearchPageController extends GetxController {
  final searchController = TextEditingController();
  final isLoading = false.obs;
  final searchResults = <BeauticianModel>[].obs;
  final recentSearches = <String>['Bridal Makeup', 'Hair Styling', 'Nail Art'].obs;
  final hasSearched = false.obs;
  final selectedEventType = ''.obs;
  final minPrice = 0.0.obs;
  final maxPrice = 500.0.obs;
  final minRating = 0.0.obs;
  Timer? _debounce;

  void onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () { if (query.isNotEmpty) performSearch(query); else { searchResults.clear(); hasSearched.value = false; } });
  }

  Future<void> performSearch(String query) async {
    isLoading.value = true; hasSearched.value = true;
    await Future.delayed(const Duration(milliseconds: 800));
    searchResults.value = [
      BeauticianModel(id: '1', name: 'Sophia Laurent', specialty: 'Bridal Makeup Artist', imageUrl: 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?w=400', rating: 4.9, reviewCount: 234, experienceYears: 8, pricePerHour: 150, location: 'New York', bio: ''),
      BeauticianModel(id: '2', name: 'Emma Chen', specialty: 'Hair Stylist', imageUrl: 'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=400', rating: 4.8, reviewCount: 189, experienceYears: 6, pricePerHour: 120, location: 'Los Angeles', bio: ''),
      BeauticianModel(id: '3', name: 'Aria Williams', specialty: 'Skincare Expert', imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=400', rating: 4.7, reviewCount: 156, experienceYears: 10, pricePerHour: 130, location: 'Miami', bio: ''),
      BeauticianModel(id: '4', name: 'Isabella Rose', specialty: 'Nail Artist', imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400', rating: 4.9, reviewCount: 312, experienceYears: 7, pricePerHour: 90, location: 'Chicago', bio: ''),
    ];
    if (!recentSearches.contains(query)) { recentSearches.insert(0, query); if (recentSearches.length > 5) recentSearches.removeLast(); }
    isLoading.value = false;
  }

  void clearSearch() { searchController.clear(); searchResults.clear(); hasSearched.value = false; }
  void applyFilters() { Get.back(); if (searchController.text.isNotEmpty) performSearch(searchController.text); }
  void resetFilters() { selectedEventType.value = ''; minPrice.value = 0; maxPrice.value = 500; minRating.value = 0; }

  @override
  void onClose() { _debounce?.cancel(); searchController.dispose(); super.onClose(); }
}
