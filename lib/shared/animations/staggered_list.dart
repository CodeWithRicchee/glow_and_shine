import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StaggeredList extends StatelessWidget {
  final List<Widget> children;
  final Duration staggerDelay;
  final Duration itemDuration;
  final Axis axis;

  const StaggeredList({
    super.key,
    required this.children,
    this.staggerDelay = const Duration(milliseconds: 80),
    this.itemDuration = const Duration(milliseconds: 400),
    this.axis = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.asMap().entries.map((entry) {
        final delay = staggerDelay * entry.key;
        return entry.value
            .animate(delay: delay)
            .fadeIn(duration: itemDuration, curve: Curves.easeOut)
            .slideY(
              begin: 0.1,
              end: 0,
              duration: itemDuration,
              curve: Curves.easeOut,
            );
      }).toList(),
    );
  }
}

extension StaggeredListExtension on List<Widget> {
  List<Widget> staggeredAnimate({
    Duration staggerDelay = const Duration(milliseconds: 80),
    Duration itemDuration = const Duration(milliseconds: 400),
  }) {
    return asMap().entries.map((entry) {
      final delay = staggerDelay * entry.key;
      return entry.value
          .animate(delay: delay)
          .fadeIn(duration: itemDuration, curve: Curves.easeOut)
          .slideY(
            begin: 0.1,
            end: 0,
            duration: itemDuration,
            curve: Curves.easeOut,
          );
    }).toList();
  }
}
