import 'package:dartz/dartz.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/features/onboarding/domain/entities/user_entity.dart';

abstract class OnboardingRepository {
  ///
  Future<Either<Failure, void>> createAccount({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  });

  ///
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
}
