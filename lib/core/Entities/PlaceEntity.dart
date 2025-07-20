// ignore_for_file: file_names

import 'package:in_egypt_admin_panel/core/Entities/PlaceReviewEntity.dart';

class PlaceEntity {
  String id, location, category, name, description;
  List<String> images;
  double latitude, longitude;
  DateTime createdAt, updatedAt;
  double rating, ticketPrice;
  List<PlaceReviewEntity>? placeReviewsEntity;

  PlaceEntity({
    this.placeReviewsEntity,
    required this.id,
    required this.location,
    required this.category,
    required this.name,
    required this.description,
    required this.images,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.ticketPrice,
  });
}
