import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt_admin_panel/features/Auth/data/Models/UserModel.dart';

class PlaceReviewModel {
  final Map<String, dynamic> user;
  final double rating;
  final String review;
  final DateTime createdAt;
  PlaceReviewModel({
    required this.user,
    required this.rating,
    required this.review,
    required this.createdAt,
  });

  factory PlaceReviewModel.fromJson(Map<String, dynamic> json) {
    return PlaceReviewModel(
      user: json['user'],
      rating: json['rating'],
      review: json['review'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }
  factory PlaceReviewModel.fromEntity(PlaceReviewEntity entity) {
    return PlaceReviewModel(
      user: UserModel.fromEntity(entity.user).toJson(),
      rating: entity.rating,
      review: entity.review,
      createdAt: entity.createdAt,
    );
  }
  PlaceReviewEntity toEntity() {
    return PlaceReviewEntity(
      user: UserModel.fromJson(user).toEntity(),
      rating: rating,
      review: review,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'rating': rating,
      'review': review,
      'createdAt': createdAt,
    };
  }
}
