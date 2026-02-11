class LocationModel {
  final double latitude;
  final double longitude;
  final String address;
  final String? city;
  final String? state;

  LocationModel({required this.latitude, required this.longitude, required this.address, this.city, this.state});
}
