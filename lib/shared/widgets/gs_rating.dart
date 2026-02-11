import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../app/theme/app_colors.dart';

class GSRating extends StatelessWidget {
  final double rating;
  final double size;
  final bool interactive;
  final ValueChanged<double>? onRatingUpdate;

  const GSRating({
    super.key,
    required this.rating,
    this.size = 16,
    this.interactive = false,
    this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size,
      ignoreGestures: !interactive,
      unratedColor: AppColors.coolGrey.withValues(alpha: 0.3),
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: AppColors.roseGold,
      ),
      onRatingUpdate: onRatingUpdate ?? (_) {},
    );
  }
}
