import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';

class PlaceModel {
  final String id, location, category, name, description;
  final List<String> imagesURLs;
  final double latitude, longitude;
  final DateTime createdAt, updatedAt;
  final double rating, ticketPrice;

  PlaceModel({
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

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['id'],
      location: json['location'],
      category: json['category'],
      name: json['name'],
      description: json['description'],
      imagesURLs: json['imagesURLs'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      rating: json['rating'],
      ticketPrice: json['ticketPrice'],
    );
  }
  factory PlaceModel.fromEntity(PlaceEntity placeEntity) {
    return PlaceModel(
      id: placeEntity.id,
      location: placeEntity.location,
      category: placeEntity.category,
      name: placeEntity.name,
      description: placeEntity.description,
      imagesURLs: placeEntity.images,
      latitude: placeEntity.latitude,
      longitude: placeEntity.longitude,
      createdAt: placeEntity.createdAt,
      updatedAt: placeEntity.updatedAt,
      rating: placeEntity.rating,
      ticketPrice: placeEntity.ticketPrice,
    );
  }
  PlaceEntity toEntity() {
    return PlaceEntity(
      id: id,
      location: location,
      category: category,
      name: name,
      description: description,
      images: imagesURLs,
      latitude: latitude,
      longitude: longitude,
      createdAt: createdAt,
      updatedAt: updatedAt,
      rating: rating,
      ticketPrice: ticketPrice,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'category': category,
      'name': name,
      'description': description,
      'imagesURLs': imagesURLs,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'rating': rating,
      'ticketPrice': ticketPrice,
    };
  }
}
