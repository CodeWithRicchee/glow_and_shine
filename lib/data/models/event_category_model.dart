import 'package:flutter/material.dart';

class EventCategoryModel {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final String imageUrl;
  final int beauticianCount;
  final String gradient;

  EventCategoryModel({required this.id, required this.name, required this.description, required this.icon, required this.imageUrl, this.beauticianCount = 0, this.gradient = 'roseGold'});
}
