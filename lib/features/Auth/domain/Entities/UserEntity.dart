// ignore_for_file: file_names

class UserEntity {
  String uid;
  String fullName, firstName, lastName, email, phoneNumber, photoUrl, role;
  String createdAt;
  final bool isBlocked;
  final bool isVerified;
  UserEntity({
    required this.uid,
    required this.firstName,
    required this.isBlocked,
    required this.isVerified,
    required this.fullName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
    required this.role,
    required this.createdAt,
  });
}
