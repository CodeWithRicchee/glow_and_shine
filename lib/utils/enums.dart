enum BookingStatus {
  pending,
  confirmed,
  completed,
  cancelled;

  String get label {
    switch (this) {
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }
}

enum EventType {
  wedding('Wedding', '💍'),
  fashion('Fashion Show', '👗'),
  corporate('Corporate', '💼'),
  prom('Prom', '🎓'),
  engagement('Engagement', '💑'),
  festival('Festival', '🎉'),
  photoshoot('Photoshoot', '📸'),
  everydayGlam('Everyday Glam', '✨'),
  bridalShower('Bridal Shower', '🎊'),
  birthday('Birthday', '🎂'),
  anniversary('Anniversary', '🥂'),
  redCarpet('Red Carpet', '🌟');

  final String label;
  final String emoji;
  const EventType(this.label, this.emoji);
}

enum ServiceCategory {
  makeup('Makeup'),
  hair('Hair Styling'),
  nails('Nail Art'),
  skincare('Skincare'),
  mehndi('Mehndi'),
  draping('Draping');

  final String label;
  const ServiceCategory(this.label);
}
