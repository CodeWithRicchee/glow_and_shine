import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../app/theme/app_colors.dart';

class GSAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final String? name;
  final bool hasBorder;

  const GSAvatar({
    super.key,
    this.imageUrl,
    this.size = 48,
    this.name,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: hasBorder
            ? Border.all(color: AppColors.roseGold, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.deepPlum.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                placeholder: (_, __) => _placeholder(),
                errorWidget: (_, __, ___) => _placeholder(),
              )
            : _placeholder(),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: AppColors.softPink,
      child: Center(
        child: name != null && name!.isNotEmpty
            ? Text(
                name![0].toUpperCase(),
                style: TextStyle(
                  color: AppColors.roseGold,
                  fontWeight: FontWeight.bold,
                  fontSize: size * 0.4,
                ),
              )
            : Icon(
                Icons.person,
                color: AppColors.roseGold,
                size: size * 0.5,
              ),
      ),
    );
  }
}
