import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class PlaceReviewEntity {
  final UserEntity user;
  final double rating;
  final String review;
  final DateTime createdAt;

  PlaceReviewEntity({
    required this.user,

    required this.rating,
    required this.review,
    required this.createdAt,
  });
}
