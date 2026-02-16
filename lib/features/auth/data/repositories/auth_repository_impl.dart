import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final userModel = UserModel.fromJson(response.data['user']);
        return Right(userModel.toEntity());
      } else {
        return const Left(AuthenticationFailure('Login failed'));
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
    try {
      final response = await _apiClient.post(
        ApiConstants.register,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'role': role,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final userModel = UserModel.fromJson(response.data['user']);
        return Right(userModel.toEntity());
      } else {
        return const Left(AuthenticationFailure('Registration failed'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _apiClient.post(ApiConstants.logout);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
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
