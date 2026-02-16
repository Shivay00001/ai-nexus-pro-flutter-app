import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/learning_path.dart';
import '../repositories/learning_path_repository.dart';

class GetPersonalizedPathUseCase {
  final LearningPathRepository repository;

  GetPersonalizedPathUseCase(this.repository);

  Future<Either<Failure, LearningPath>> call() async {
    return await repository.getPersonalizedPath();
  }
}
