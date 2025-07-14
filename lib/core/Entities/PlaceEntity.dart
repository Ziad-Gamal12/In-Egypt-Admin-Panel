import 'package:in_egypt_admin_panel/core/Entities/PlaceReviewEntity.dart';

class PlaceEntity {
  final String id, location, category, name, description;
  final List<String> imagesURLs;
  final double latitude, longitude;
  final DateTime createdAt, updatedAt;
  final double rating, ticketPrice;
  List<PlaceReviewEntity>? placeReviewsEntity;

  PlaceEntity({
    this.placeReviewsEntity,
    required this.id,
    required this.location,
    required this.category,
    required this.name,
    required this.description,
    required this.imagesURLs,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.ticketPrice,
  });
}
