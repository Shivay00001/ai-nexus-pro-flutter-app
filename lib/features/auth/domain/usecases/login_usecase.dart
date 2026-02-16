import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  
  LoginUseCase(this.repository);
  
  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    // Validate inputs
    if (email.isEmpty || password.isEmpty) {
      return const Left(
        ValidationFailure('Email and password are required'),
      );
    }
    
    if (!_isValidEmail(email)) {
      return const Left(
        ValidationFailure('Please enter a valid email'),
      );
    }
    
    if (password.length < 6) {
      return const Left(
        ValidationFailure('Password must be at least 6 characters'),
      );
    }
    
    return await repository.login(
      email: email,
      password: password,
    );
  }
  
  bool _isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }
}
