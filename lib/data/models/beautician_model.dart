class BeauticianModel {
  final String id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final int experienceYears;
  final double pricePerHour;
  final String location;
  final String bio;
  final List<String> eventTypes;
  final List<String> portfolioImages;
  final bool isAvailable;
  final bool isFeatured;

  BeauticianModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.experienceYears,
    required this.pricePerHour,
    required this.location,
    required this.bio,
    this.eventTypes = const [],
    this.portfolioImages = const [],
    this.isAvailable = true,
    this.isFeatured = false,
  });

  factory BeauticianModel.fromJson(Map<String, dynamic> json) => BeauticianModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    specialty: json['specialty'] ?? '',
    imageUrl: json['image_url'] ?? '',
    rating: (json['rating'] ?? 0).toDouble(),
    reviewCount: json['review_count'] ?? 0,
    experienceYears: json['experience_years'] ?? 0,
    pricePerHour: (json['price_per_hour'] ?? 0).toDouble(),
    location: json['location'] ?? '',
    bio: json['bio'] ?? '',
    eventTypes: List<String>.from(json['event_types'] ?? []),
    portfolioImages: List<String>.from(json['portfolio_images'] ?? []),
    isAvailable: json['is_available'] ?? true,
    isFeatured: json['is_featured'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'specialty': specialty,
    'image_url': imageUrl,
    'rating': rating,
    'review_count': reviewCount,
    'experience_years': experienceYears,
    'price_per_hour': pricePerHour,
    'location': location,
    'bio': bio,
    'event_types': eventTypes,
    'portfolio_images': portfolioImages,
    'is_available': isAvailable,
    'is_featured': isFeatured,
  };
}
