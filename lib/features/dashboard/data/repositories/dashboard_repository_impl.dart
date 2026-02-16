import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../models/dashboard_data_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final ApiClient _apiClient;

  DashboardRepositoryImpl(this._apiClient);

  @override
  Future<Either<Failure, DashboardData>> getDashboardData() async {
    try {
      final response = await _apiClient.get(ApiConstants.progressiveStats); // Ensure this matches endpoint

      if (response.statusCode == 200) {
        final data = DashboardDataModel.fromJson(response.data);
        return Right(data.toEntity());
      } else {
        return const Left(ServerFailure('Failed to fetch dashboard data'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
