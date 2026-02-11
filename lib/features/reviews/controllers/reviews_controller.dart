import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/review_model.dart';

class ReviewsController extends GetxController {
  final isLoading = true.obs;
  final reviews = <ReviewModel>[].obs;
  final averageRating = 0.0.obs;
  final ratingDistribution = <int, int>{}.obs;
  final userRating = 0.0.obs;
  final commentController = TextEditingController();
  final selectedPhotos = <String>[].obs;
  final isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadReviews();
  }

  Future<void> loadReviews() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    reviews.value = [
      ReviewModel(id: 'r1', userId: 'u1', userName: 'Sarah M.', userAvatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200', beauticianId: 'b1', rating: 5.0, comment: 'Absolutely stunning bridal makeup! Alexandra made me feel like a queen on my wedding day. Highly recommend!', photoUrls: ['https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=400'], serviceName: 'Bridal Makeup', createdAt: DateTime(2024, 12, 20)),
      ReviewModel(id: 'r2', userId: 'u2', userName: 'Jessica L.', userAvatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200', beauticianId: 'b1', rating: 4.5, comment: 'Great experience! The hair styling lasted all night at the event. Will definitely book again.', photoUrls: [], serviceName: 'Event Styling', createdAt: DateTime(2024, 12, 15)),
      ReviewModel(id: 'r3', userId: 'u3', userName: 'Emily R.', userAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200', beauticianId: 'b2', rating: 5.0, comment: 'Perfect prom look! All my friends were asking who did my makeup. Thank you so much!', photoUrls: ['https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?w=400', 'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?w=400'], serviceName: 'Prom Glam', createdAt: DateTime(2024, 12, 10)),
      ReviewModel(id: 'r4', userId: 'u4', userName: 'Maria K.', userAvatar: null, beauticianId: 'b1', rating: 4.0, comment: 'Very professional and talented. The corporate look was exactly what I needed for my conference presentation.', photoUrls: [], serviceName: 'Corporate Look', createdAt: DateTime(2024, 11, 28)),
      ReviewModel(id: 'r5', userId: 'u5', userName: 'Olivia P.', userAvatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200', beauticianId: 'b2', rating: 5.0, comment: 'The best makeup artist I\'ve ever worked with. The engagement party look was flawless and lasted the entire evening!', photoUrls: ['https://images.unsplash.com/photo-1519699047748-de8e457a634e?w=400'], serviceName: 'Engagement Party', createdAt: DateTime(2024, 11, 20)),
    ];
    averageRating.value = reviews.fold(0.0, (sum, r) => sum + r.rating) / reviews.length;
    ratingDistribution.value = {5: 3, 4: 1, 3: 0, 2: 0, 1: 0};
    isLoading.value = false;
  }

  Future<void> submitReview() async {
    if (userRating.value == 0) {
      Get.snackbar('Rating Required', 'Please select a rating', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (commentController.text.trim().isEmpty) {
      Get.snackbar('Comment Required', 'Please write a review', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isSubmitting.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final newReview = ReviewModel(
      id: 'r${reviews.length + 1}',
      userId: 'u1',
      userName: 'Alexandra Rose',
      userAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
      beauticianId: Get.parameters['beauticianId'] ?? 'b1',
      rating: userRating.value,
      comment: commentController.text.trim(),
      photoUrls: selectedPhotos.toList(),
      serviceName: 'General',
      createdAt: DateTime.now(),
    );
    reviews.insert(0, newReview);
    isSubmitting.value = false;
    Get.back();
    Get.snackbar('Thank You!', 'Your review has been submitted', snackPosition: SnackPosition.BOTTOM);
  }

  void resetForm() {
    userRating.value = 0;
    commentController.clear();
    selectedPhotos.clear();
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
}
