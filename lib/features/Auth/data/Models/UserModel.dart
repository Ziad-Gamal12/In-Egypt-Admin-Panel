import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class UserModel {
  final String uid, firstName, lastName, email, phoneNumber, photoUrl, role;
  final String createdAt;
  final bool isVerified;
  final bool isBlocked;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.isBlocked,
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
      isBlocked: json['isBlocked'] ?? false,
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      role: json['role'] ?? '',
      createdAt: json['createdAt'],
    );
  }
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      firstName: entity.firstName,
      lastName: entity.lastName,
      isVerified: entity.isVerified,
      isBlocked: entity.isBlocked,
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
      isBlocked: isBlocked,
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
      'isBlocked': isBlocked,
      'email': email,
      'phoneNumber': phoneNumber,
      'isVerified': isVerified,
      'photoUrl': photoUrl,
      'role': role,
      'createdAt': createdAt,
    };
  }
}
