import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String role;
  final String? profileImage;
  final DateTime createdAt;
  final bool isEmailVerified;
  
  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.profileImage,
    required this.createdAt,
    required this.isEmailVerified,
  });
  
  @override
  List<Object?> get props => [
    id,
    email,
    name,
    role,
    profileImage,
    createdAt,
    isEmailVerified,
  ];
  
  bool get isStudent => role == 'student';
  bool get isTeacher => role == 'teacher';
  bool get isParent => role == 'parent';
  bool get isAdmin => role == 'admin';
}
