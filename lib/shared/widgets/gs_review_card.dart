import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/models/review_model.dart';
import '../../utils/formatters.dart';
import 'gs_avatar.dart';
import 'gs_rating.dart';

class GSReviewCard extends StatelessWidget {
  final ReviewModel review;

  const GSReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingMd,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: AppSpacing.borderRadiusMd,
        boxShadow: [
          BoxShadow(
            color: AppColors.deepPlum.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GSAvatar(
                imageUrl: review.userAvatar,
                name: review.userName,
                size: 40,
              ),
              AppSpacing.gapW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      Formatters.relativeTime(review.createdAt),
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: AppColors.coolGrey,
                      ),
                    ),
                  ],
                ),
              ),
              GSRating(rating: review.rating, size: 14),
            ],
          ),
          AppSpacing.gapH12,
          Text(
            review.comment,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.warmGrey,
              height: 1.5,
            ),
          ),
          if (review.photoUrls.isNotEmpty) ...[
            AppSpacing.gapH12,
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: review.photoUrls.length,
                separatorBuilder: (_, __) => AppSpacing.gapW8,
                itemBuilder: (_, index) => ClipRRect(
                  borderRadius: AppSpacing.borderRadiusSm,
                  child: Image.network(
                    review.photoUrls[index],
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          if (review.serviceName != null) ...[
            AppSpacing.gapH8,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.softPink,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                review.serviceName!,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: AppColors.roseGold,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
