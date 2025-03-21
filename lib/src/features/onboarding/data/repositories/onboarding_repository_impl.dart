import 'package:dartz/dartz.dart';
import 'package:evoltsoft/src/core/utills/error/exceptions.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/core/utills/network/network_info.dart';
import 'package:evoltsoft/src/features/onboarding/data/datasources/remote/onboarding_remote_datasource.dart';
import 'package:evoltsoft/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as : OnboardingRepository)
class OnboardingRepositoryImpl extends OnboardingRepository {
  final OnboardingRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OnboardingRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, void>> createAccount({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) async {
    final isNetworkConnected = await networkInfo.isConnected;
    if (isNetworkConnected ?? false) {
      try {
        return Right(
          await remoteDataSource.createAccount(
            email: email,
            password: password,
          ),
        );
      } on ServerException catch (error) {
        return Left(
          ServerFailure(message: error.errorMessage, code: error.errorCode),
        );
      } on CacheException catch (error) {
        return Left(
          CacheFailure(message: error.errorMessage, code: error.errorCode),
        );
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    final isNetworkConnected = await networkInfo.isConnected;
    if (isNetworkConnected ?? false) {
      try {
        return Right(
          await remoteDataSource.login(email: email, password: password),
        );
      } on ServerException catch (error) {
        return Left(
          ServerFailure(message: error.errorMessage, code: error.errorCode),
        );
      } on CacheException catch (error) {
        return Left(
          CacheFailure(message: error.errorMessage, code: error.errorCode),
        );
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
