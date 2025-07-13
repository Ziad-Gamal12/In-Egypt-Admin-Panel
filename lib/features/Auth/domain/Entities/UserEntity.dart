// ignore_for_file: file_names

class UserEntity {
  String uid;
  String firstName, lastName, email, phoneNumber, photoUrl, role;
  DateTime createdAt;
  final bool isVerified;
  UserEntity({
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
}
