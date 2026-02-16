import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
    required String role,
  });
  
  Future<Either<Failure, void>> logout();
  
  Future<Either<Failure, User>> getCurrentUser();
  
  Future<Either<Failure, String>> refreshToken();
  
  Future<Either<Failure, void>> forgotPassword(String email);
  
  Future<Either<Failure, void>> resetPassword({
    required String token,
    required String newPassword,
  });
  
  Future<Either<Failure, void>> verifyEmail(String token);
  
  Future<Either<Failure, User>> updateProfile({
    required String name,
    String? profileImage,
  });
  
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
