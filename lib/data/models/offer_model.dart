class OfferModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double discountPercent;
  final String? code;
  final DateTime validUntil;

  OfferModel({required this.id, required this.title, required this.description, required this.imageUrl, required this.discountPercent, this.code, required this.validUntil});

  bool get isValid => validUntil.isAfter(DateTime.now());
}
