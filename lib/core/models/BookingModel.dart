import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/models/PlaceModel.dart';
import 'package:in_egypt_admin_panel/features/Auth/data/Models/UserModel.dart';

class BookingModel {
  final Map<String, dynamic> user;
  final Map<String, dynamic> place;
  final DateTime startAt;
  final DateTime endAt;
  final DateTime createdAt;
  final double daysDuration;
  final int numberOfGuests;
  final String status;
  final String id;
  final double totalPrice;
  final String paymentMethod;

  BookingModel({
    required this.user,
    required this.place,
    required this.startAt,
    required this.endAt,
    required this.createdAt,
    required this.daysDuration,
    required this.numberOfGuests,
    required this.status,
    required this.id,
    required this.totalPrice,
    required this.paymentMethod,
  });
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      user: json['user'],
      place: json['place'],
      startAt: (json['startAt'] as Timestamp).toDate(),
      endAt: (json['endAt'] as Timestamp).toDate(),
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      daysDuration: (json['daysDuration'] as num).toDouble(),
      numberOfGuests: (json['numberOfGuests'] as num).toInt(),
      status: json['status'],
      id: json['id'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      paymentMethod: json['paymentMethod'],
    );
  }
  factory BookingModel.fromEntity(BookingEntity entity) {
    return BookingModel(
      user: UserModel.fromEntity(entity.user).toJson(),
      place: PlaceModel.fromEntity(entity.place).toJson(),
      startAt: entity.startAt,
      endAt: entity.endAt,
      createdAt: entity.createdAt,
      daysDuration: entity.daysDuration,
      numberOfGuests: entity.numberOfGuests,
      status: entity.status,
      id: entity.id,
      totalPrice: entity.totalPrice,
      paymentMethod: entity.paymentMethod,
    );
  }

  BookingEntity toEntity() {
    return BookingEntity(
      user: UserModel.fromJson(user).toEntity(),
      place: PlaceModel.fromJson(place).toEntity(),
      startAt: startAt,
      endAt: endAt,
      createdAt: createdAt,
      daysDuration: daysDuration,
      numberOfGuests: numberOfGuests,
      status: status,
      id: id,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'place': place,
      'startAt': startAt,
      'endAt': endAt,
      'createdAt': createdAt,
      'daysDuration': daysDuration,
      'numberOfGuests': numberOfGuests,
      'status': status,
      'id': id,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
    };
  }
}
