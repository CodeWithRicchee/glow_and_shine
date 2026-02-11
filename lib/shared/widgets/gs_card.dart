import 'package:flutter/material.dart';
import '../../app/theme/app_decorations.dart';
import '../../app/theme/app_spacing.dart';

class GSCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final bool elevated;

  const GSCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.elevated = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? AppSpacing.paddingMd,
        decoration: elevated
            ? AppDecorations.elevatedCardDecoration
            : AppDecorations.cardDecoration,
        child: child,
      ),
    );
  }
}
