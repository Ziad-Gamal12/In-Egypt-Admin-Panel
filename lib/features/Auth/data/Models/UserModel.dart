import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class UserModel {
  final String uid, firstName, lastName, email, phoneNumber, photoUrl, role;
  final DateTime createdAt;
  final bool isVerified;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.isVerified,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
    required this.role,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      firstName: json['firstName'] ?? '',
      isVerified: json['isVerified'] ?? false,
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      role: json['role'] ?? '',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      firstName: entity.firstName,
      lastName: entity.lastName,
      isVerified: entity.isVerified,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      photoUrl: entity.photoUrl,
      role: entity.role,
      createdAt: entity.createdAt,
    );
  }
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      isVerified: isVerified,
      email: email,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
      role: role,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'isVerified': isVerified,
      'photoUrl': photoUrl,
      'role': role,
      'createdAt': createdAt,
    };
  }
}
