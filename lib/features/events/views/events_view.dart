import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_cached_image.dart';
import '../../../shared/widgets/gs_shimmer.dart';
import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Iconsax.arrow_left), onPressed: () => Get.back()),
        title: Text('Event Categories', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Padding(
            padding: AppSpacing.screenPadding,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.85,
              children: List.generate(8, (_) => const GSShimmerBox(height: 180)),
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final cat = controller.categories[index];
            return GestureDetector(
              onTap: () {
                controller.loadCategoryDetails(cat);
                Get.toNamed(AppRoutes.eventDetail, arguments: cat);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: AppSpacing.borderRadiusLg,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.deepPlum.withValues(alpha: 0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: AppSpacing.borderRadiusLg,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      GSCachedImage(imageUrl: cat.imageUrl, width: double.infinity, height: double.infinity),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        right: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(cat.icon, color: Colors.white, size: 24),
                            AppSpacing.gapH4,
                            Text(cat.name, style: GoogleFonts.playfairDisplay(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                            Text('${cat.beauticianCount} artists', style: GoogleFonts.poppins(fontSize: 11, color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).animate().fadeIn(delay: Duration(milliseconds: 60 * index), duration: 300.ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1), delay: Duration(milliseconds: 60 * index), duration: 300.ms);
          },
        );
      }),
    );
  }
}
