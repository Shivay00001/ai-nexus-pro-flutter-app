import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      // Mock login for now
      await Future.delayed(const Duration(seconds: 1));
      if (email == 'student@example.com' && password == 'password') {
        return Right(User(
          id: '1',
          email: email,
          name: 'Demo Student',
          role: 'student',
          createdAt: DateTime.now(),
          isEmailVerified: true,
        ));
      } else {
        return const Left(AuthenticationFailure('Invalid email or password'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    // Mock register
    return Right(User(
      id: '2',
      email: email,
      name: name,
      role: role,
      createdAt: DateTime.now(),
      isEmailVerified: false,
    ));
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> refreshToken() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String token, required String newPassword}) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyEmail(String token) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> updateProfile({required String name, String? profileImage}) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> changePassword({required String oldPassword, required String newPassword}) async {
    throw UnimplementedError();
  }
}
