class ServiceModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final int durationMinutes;
  final String category;
  final String? imageUrl;
  final bool isPopular;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
    required this.category,
    this.imageUrl,
    this.isPopular = false,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    price: (json['price'] ?? 0).toDouble(),
    durationMinutes: json['duration_minutes'] ?? 0,
    category: json['category'] ?? '',
    imageUrl: json['image_url'],
    isPopular: json['is_popular'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'duration_minutes': durationMinutes,
    'category': category,
    'image_url': imageUrl,
    'is_popular': isPopular,
  };
}
