class ReviewModel {
  final String id;
  final String userId;
  final String userName;
  final String? userAvatar;
  final String beauticianId;
  final double rating;
  final String comment;
  final List<String> photoUrls;
  final DateTime createdAt;
  final String? serviceName;

  ReviewModel({required this.id, required this.userId, required this.userName, this.userAvatar, required this.beauticianId, required this.rating, required this.comment, this.photoUrls = const [], required this.createdAt, this.serviceName});
}
