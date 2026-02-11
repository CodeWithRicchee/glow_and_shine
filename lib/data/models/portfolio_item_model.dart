class PortfolioItemModel {
  final String id;
  final String imageUrl;
  final String? title;
  final String? eventType;
  final DateTime? createdAt;

  PortfolioItemModel({required this.id, required this.imageUrl, this.title, this.eventType, this.createdAt});
}
